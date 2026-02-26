package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"

	"os"

	"github.com/hadenlabs/terraform-cloudflare/internal/app/external/faker"
)

func TestBasicSuccess(t *testing.T) {
	t.Parallel()
	zone := os.Getenv("CLOUDFLARE_ZONE")
	zoneID := os.Getenv("CLOUDFLARE_ZONE_ID")
	accountID := os.Getenv("CLOUDFLARE_ACCOUNT_ID")
	name := faker.Email().Name()
	email := fmt.Sprintf("%s@%s", name, zone)
	destinationEmails := []string{fmt.Sprintf("%s@%s", faker.Email().Name(), zone)}

	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "email-basic",
		Upgrade:      true,
		Vars: map[string]interface{}{
			"name":              name,
			"zone":              zone,
			"zone_id":           zoneID,
			"account_id":        accountID,
			"email":             email,
			"destination_email": destinationEmails,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
	outputID := terraform.Output(t, terraformOptions, "id")
	assert.NotEmpty(t, outputID, outputID)

	assert.NotEmpty(t, zone, "Missing CLOUDFLARE_ZONE env var")
	assert.NotEmpty(t, accountID, "Missing CLOUDFLARE_ACCOUNT_ID env var")
}
