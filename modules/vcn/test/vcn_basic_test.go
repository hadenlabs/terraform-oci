package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"

	"github.com/hadenlabs/terraform-oci/internal/testutil/oci"
)

func TestVCNBasicSuccess(t *testing.T) {
	t.Parallel()

	// Generate fake data for the test
	vcn := oci.NewVCN()

	compartmentID := vcn.CompartmentID
	cidrBlocks := vcn.CIDRBlocks
	displayName := vcn.DisplayName
	dnsLabel := vcn.DNSLabel

	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "vcn-basic",
		Upgrade:      true,
		Vars: map[string]any{
			// Required variables
			"compartment_id": compartmentID,
			"cidr_blocks":    cidrBlocks,
			"display_name":   displayName,

			// Optional variables
			"dns_label":      dnsLabel,
			"freeform_tags":  map[string]any{},
			"defined_tags":   map[string]any{},
			"is_ipv6enabled": false,

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
	outputVCNID := terraform.Output(t, terraformOptions, "vcn_id")
	outputDisplayName := terraform.Output(t, terraformOptions, "display_name")

	// Assertions
	assert.Equal(t, "true", outputModuleEnabled, "Module should be enabled")
	assert.NotEmpty(t, outputVCNID, "VCN ID should not be empty")
	assert.Equal(t, displayName, outputDisplayName, "Display name should match")
}
