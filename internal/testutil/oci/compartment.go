package oci

import (
	"github.com/hadenlabs/terraform-oci/internal/app/external/faker"
)

type Compartment struct {
	Name        string
	Description string
}

func NewCompartment() *Compartment {
	fake := faker.Compartment()

	return &Compartment{
		Name:        fake.Name(),
		Description: fake.Description(),
	}
}
