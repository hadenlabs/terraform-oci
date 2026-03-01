package oci

import (
	"crypto/rand"
	"fmt"
	"math/big"

	"github.com/hadenlabs/terraform-oci/internal/app/external/faker"
)

type VCN struct {
	DisplayName   string
	CIDRBlocks    []string
	CompartmentID string
	DNSLabel      string
}

func NewVCN() *VCN {
	compute := NewCompute()
	fake := faker.Compute()

	// Generate a unique display name using the compute faker
	displayName := fmt.Sprintf("vcn-%s", fake.DisplayName())

	// Generate valid CIDR blocks (non-overlapping, RFC 1918 compliant)
	// Using different private IP ranges to avoid conflicts
	cidrBlocks := generateCIDRBlocks()

	// Use the same compartment ID as compute for consistency
	compartmentID := compute.CompartmentID

	// Generate DNS label from display name (first 15 chars, lowercase, alphanumeric)
	dnsLabel := generateDNSLabel(displayName)

	return &VCN{
		DisplayName:   displayName,
		CIDRBlocks:    cidrBlocks,
		CompartmentID: compartmentID,
		DNSLabel:      dnsLabel,
	}
}

// generateCIDRBlocks generates valid, non-overlapping CIDR blocks for testing
func generateCIDRBlocks() []string {
	// Use different private IP ranges to avoid conflicts
	// 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16
	cidrOptions := [][]string{
		{"10.0.0.0/16"},
		{"172.16.0.0/20"},
		{"192.168.0.0/24"},
		{"10.0.0.0/16", "10.1.0.0/16"}, // Multiple CIDR blocks example
	}

	// Randomly select a CIDR block configuration
	idx, err := rand.Int(rand.Reader, big.NewInt(int64(len(cidrOptions))))
	if err != nil {
		// Fallback to first option if random generation fails
		return cidrOptions[0]
	}
	return cidrOptions[idx.Int64()]
}

// generateDNSLabel creates a valid DNS label from display name
func generateDNSLabel(displayName string) string {
	// Take first 15 characters, convert to lowercase, remove non-alphanumeric
	// DNS labels must be 1-63 chars, start and end with alphanumeric, contain only alphanumeric or hyphens
	label := sanitizeDisplayName(displayName)

	// Remove leading/trailing hyphens
	label = trimHyphens(label)

	// If label is empty after cleaning, use default
	if len(label) == 0 {
		label = "vcn"
	}

	return label
}

// sanitizeDisplayName processes the display name to create a valid DNS label
func sanitizeDisplayName(displayName string) string {
	label := ""
	maxLen := len(displayName)
	if maxLen > 15 {
		maxLen = 15
	}

	for i := 0; i < maxLen; i++ {
		c := displayName[i]
		label += processChar(c)
	}

	if len(label) == 0 {
		label = "vcn"
	}

	return label
}

// processChar processes a single character for DNS label
func processChar(c byte) string {
	if isLowerAlphaNumericOrHyphen(c) {
		return string(c)
	}
	if isUpperAlpha(c) {
		return string(c + 32) // Convert to lowercase
	}
	return ""
}

// isLowerAlphaNumericOrHyphen checks if character is valid for DNS label
func isLowerAlphaNumericOrHyphen(c byte) bool {
	return (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || (c == '-')
}

// isUpperAlpha checks if character is uppercase letter
func isUpperAlpha(c byte) bool {
	return c >= 'A' && c <= 'Z'
}

// trimHyphens removes leading and trailing hyphens from a string
func trimHyphens(s string) string {
	start := 0
	end := len(s)

	// Find first non-hyphen character
	for start < end && s[start] == '-' {
		start++
	}

	// Find last non-hyphen character
	for end > start && s[end-1] == '-' {
		end--
	}

	return s[start:end]
}
