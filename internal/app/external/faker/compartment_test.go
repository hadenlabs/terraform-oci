package faker

import (
	"strings"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestFakeCompartmentName(t *testing.T) {
	nameFake := Compartment().Name()
	prefix := strings.Split(nameFake, "-")[0]
	assert.Contains(t, names, prefix, prefix)
}

func TestFakeCompartmentDescription(t *testing.T) {
	descriptionFake := Compartment().Description()
	assert.NotEmpty(t, descriptionFake)
	assert.Equal(t, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", descriptionFake)
}
