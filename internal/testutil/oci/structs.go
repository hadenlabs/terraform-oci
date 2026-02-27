package oci

import (
	"github.com/hadenlabs/terraform-oci/internal/app/external/faker"
)

type Compute struct {
	AvailabilityDomain string
	Shape              string
	DisplayName        string
	SshPublicKey       string
	CompartmentID      string
}

func NewCompute() *Compute {
	fake := faker.Compute()

	return &Compute{
		AvailabilityDomain: "us-ashburn-1",
		Shape:              "VM.Standard.A1.Flex",
		DisplayName:        fake.DisplayName(),
		SshPublicKey:       "",
		CompartmentID:      "ocid1.compartment.oc1..aaaaaaaacxgwuydfsi77ubuziuwiqrd72fg5ekbmsmm5o2nb3lejmeiycucq",
	}
}
