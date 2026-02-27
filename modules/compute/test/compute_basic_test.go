package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"

	"github.com/hadenlabs/terraform-oci/internal/testutil/oci"
)

func TestComputeBasicSuccess(t *testing.T) {
	t.Parallel()

	// Generate fake data for the test
	compute := oci.NewCompute()

	compartmentID := compute.CompartmentID
	availabilityDomain := compute.AvailabilityDomain
	displayName := compute.DisplayName
	sshPublicKey := compute.SshPublicKey
	subnetID := ""
	shape := compute.Shape

	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "compute-basic",
		Upgrade:      true,
		Vars: map[string]interface{}{
			"compartment_id":      compartmentID,
			"availability_domain": availabilityDomain,
			"display_name":        displayName,
			"ssh_public_key":      sshPublicKey,
			"subnet_id":           subnetID,
			// Optional variables
			"shape": shape,

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

	// Assertions
	assert.Equal(t, "true", outputModuleEnabled, "Module should be enabled")
}
