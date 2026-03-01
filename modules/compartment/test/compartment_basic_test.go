package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"

	"github.com/hadenlabs/terraform-oci/internal/testutil/oci"
)

func TestCompartmentBasicSuccess(t *testing.T) {
	t.Parallel()

	// Generate fake data for the test
	compute := oci.NewCompute()
	compartment := oci.NewCompartment()

	compartmentID := compute.CompartmentID
	name := compartment.Name
	description := compartment.Description

	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "compartment-basic",
		Upgrade:      true,
		Vars: map[string]any{
			"compartment_id": compartmentID,
			"name":           name,
			"description":    description,

			// Optional variables with defaults
			"enable_delete": true,
			"freeform_tags": map[string]string{},
			"defined_tags":  map[string]string{},

			// Module configuration
			"module_enabled": true,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Verify outputs
	outputModuleEnabled := terraform.Output(t, terraformOptions, "module_enabled")
	outputCompartmentID := terraform.Output(t, terraformOptions, "compartment_id")
	outputName := terraform.Output(t, terraformOptions, "name")

	// Assertions
	assert.Equal(t, "true", outputModuleEnabled, "Module should be enabled")
	assert.NotEmpty(t, outputCompartmentID, "Compartment ID should not be empty")
	assert.Equal(t, name, outputName, "Compartment name should match the input")
}
