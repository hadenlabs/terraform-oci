package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"

	"github.com/hadenlabs/terraform-oci/internal/testutil/oci"
)

func TestSubnetBasicSuccess(t *testing.T) {
	t.Parallel()

	// Generate fake data for the test
	subnet := oci.NewSubnet()

	compartmentID := subnet.CompartmentID
	vcnID := subnet.VCNID
	cidrBlock := subnet.CIDRBlock
	displayName := subnet.DisplayName

	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "subnet-basic",
		Upgrade:      true,
		Vars: map[string]any{
			"compartment_id": compartmentID,
			"vcn_id":         vcnID,
			"cidr_block":     cidrBlock,
			"display_name":   displayName,

			// Optional variables with default values
			"availability_domain":        nil,
			"route_table_id":             nil,
			"security_list_ids":          []string{},
			"prohibit_public_ip_on_vnic": true,
			"freeform_tags":              map[string]string{},
			"defined_tags":               map[string]string{},
			"dns_label":                  nil,

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
	outputSubnetID := terraform.Output(t, terraformOptions, "subnet_id")
	outputDisplayName := terraform.Output(t, terraformOptions, "display_name")

	// Assertions
	assert.Equal(t, "true", outputModuleEnabled, "Module should be enabled")
	assert.NotEmpty(t, outputSubnetID, "Subnet ID should not be empty")
	assert.Equal(t, displayName, outputDisplayName, "Display name should match")
}
