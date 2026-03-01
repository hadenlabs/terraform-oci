package oci

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestNewCompute(t *testing.T) {
	t.Parallel()

	compute := NewCompute()

	assert.Equal(t, "us-ashburn-1", compute.AvailabilityDomain, "AvailabilityDomain should default to 'us-ashburn-1'")
	assert.Equal(t, "VM.Standard.A1.Flex", compute.Shape, "Shape should default to 'VM.Standard.A1.Flex'")
	// Other fields should be faker-generated
	assert.NotEmpty(t, compute.DisplayName, "DisplayName should be faker-generated")
	assert.NotEmpty(t, compute.SshPublicKey, "SshPublicKey should be faker-generated")
}

func TestNewCompartment(t *testing.T) {
	t.Parallel()

	compartment := NewCompartment()

	// All fields should be faker-generated
	assert.NotEmpty(t, compartment.Name, "Name should be faker-generated")
	assert.NotEmpty(t, compartment.Description, "Description should be faker-generated")
}
