package faker

import (
	"crypto/rand"
	"fmt"
	"math/big"
	"strings"

	"github.com/lithammer/shortuuid/v3"

	"github.com/hadenlabs/terraform-oci/internal/errors"
)

var (
	names = []string{"optimusprime", "wheeljack", "bumblebee"}
)

type FakeCompartment interface {
	Name() string
	Description() string
}

type fakeCompartment struct{}

func Compartment() FakeCompartment {
	return fakeCompartment{}
}

func (n fakeCompartment) Name() string {
	num, err := rand.Int(rand.Reader, big.NewInt(int64(len(names))))
	if err != nil {
		panic(errors.New(errors.ErrorUnknown, err.Error()))
	}
	nameuuid := fmt.Sprintf("%s-%s", names[num.Int64()], shortuuid.New())
	return strings.ToLower(nameuuid)
}

func (n fakeCompartment) Description() string {
	return "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
}
