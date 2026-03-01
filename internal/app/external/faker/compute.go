package faker

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"encoding/pem"
	"fmt"
	"math/big"
	"strings"

	"github.com/lithammer/shortuuid/v3"

	"github.com/hadenlabs/terraform-oci/internal/errors"
)

var (
	displayNames = []string{"optimusprime", "wheeljack", "bumblebee"}
)

type FakeCompute interface {
	DisplayName() string  // DisplayName
	SshPublicKey() string // SshPublicKey
}

type fakeCompute struct{}

func Compute() FakeCompute {
	return fakeCompute{}
}

func (n fakeCompute) DisplayName() string {
	num, err := rand.Int(rand.Reader, big.NewInt(int64(len(displayNames))))
	if err != nil {
		panic(errors.New(errors.ErrorUnknown, err.Error()))
	}
	nameuuid := fmt.Sprintf("%s-%s", displayNames[num.Int64()], shortuuid.New())
	return strings.ToLower(nameuuid)
}

func (n fakeCompute) SshPublicKey() string {
	// Generate a simple RSA key for testing purposes
	// In a real scenario, this would be a proper SSH public key
	key, err := rsa.GenerateKey(rand.Reader, 2048)
	if err != nil {
		panic(errors.New(errors.ErrorUnknown, err.Error()))
	}

	// Extract public key
	pubKey := &key.PublicKey

	// Encode to PKIX format
	pubKeyBytes, err := x509.MarshalPKIXPublicKey(pubKey)
	if err != nil {
		panic(errors.New(errors.ErrorUnknown, err.Error()))
	}

	// Create PEM block (not used directly but kept for completeness)
	_ = pem.EncodeToMemory(&pem.Block{
		Type:  "RSA PUBLIC KEY",
		Bytes: pubKeyBytes,
	})

	// For SSH format, we would typically use ssh-rsa format
	// But for testing purposes, we'll return a simple mock SSH key
	uuid1 := shortuuid.New()
	uuid2 := shortuuid.New()
	// Ensure we don't exceed string length
	part1 := uuid1
	if len(uuid1) > 30 {
		part1 = uuid1[:30]
	}
	part2 := uuid2
	if len(uuid2) > 8 {
		part2 = uuid2[:8]
	}
	return fmt.Sprintf("ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC%s test-key-%s",
		part1, part2)
}
