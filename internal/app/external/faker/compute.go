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
	displayNames = []string{"optimusprime", "wheeljack", "bumblebee"}
)

type FakeCompute interface {
	DisplayName() string // DisplayName
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
