package oci

import (
	"crypto/rand"
	"fmt"
	"math/big"

	"github.com/hadenlabs/terraform-oci/internal/app/external/faker"
)

type Subnet struct {
	DisplayName   string
	CIDRBlock     string
	CompartmentID string
	VCNID         string
}

func NewSubnet() *Subnet {
	compute := NewCompute()
	fake := faker.Compute()

	// Generate a unique display name using the compute faker
	displayName := fmt.Sprintf("subnet-%s", fake.DisplayName())

	// Generate valid CIDR block (non-overlapping, RFC 1918 compliant)
	cidrBlock := generateCIDRBlock()

	// Use the same compartment ID as compute for consistency
	compartmentID := compute.CompartmentID

	// For VCN ID, we need to use a placeholder since we don't have a real VCN
	// In a real test environment, this would come from a created VCN
	vcnID := "ocid1.vcn.oc1..aaaaaaaavcnplaceholder"

	return &Subnet{
		DisplayName:   displayName,
		CIDRBlock:     cidrBlock,
		CompartmentID: compartmentID,
		VCNID:         vcnID,
	}
}

// generateCIDRBlock generates a valid CIDR block for testing
func generateCIDRBlock() string {
	// Use different private IP ranges to avoid conflicts
	// 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16
	cidrOptions := []string{
		"10.0.0.0/24",
		"10.0.1.0/24",
		"10.0.2.0/24",
		"172.16.0.0/24",
		"172.16.1.0/24",
		"192.168.0.0/24",
		"192.168.1.0/24",
	}

	// Randomly select a CIDR block
	idx, err := rand.Int(rand.Reader, big.NewInt(int64(len(cidrOptions))))
	if err != nil {
		// Fallback to first option if random generation fails
		return cidrOptions[0]
	}
	return cidrOptions[idx.Int64()]
}
