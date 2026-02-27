package faker

import (
	"strings"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestFakeComputeDisplayName(t *testing.T) {
	displayNameFake := Compute().DisplayName()
	prefix := strings.Split(displayNameFake, "-")[0]
	assert.Contains(t, displayNames, prefix, prefix)
}
