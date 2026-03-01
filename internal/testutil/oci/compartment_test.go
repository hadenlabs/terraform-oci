package oci

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestNewCompartment(t *testing.T) {
	t.Parallel()

	compartment := NewCompartment()

	// All fields should be faker-generated
	assert.NotEmpty(t, compartment.Name, "Name should be faker-generated")
	assert.NotEmpty(t, compartment.Description, "Description should be faker-generated")
}
