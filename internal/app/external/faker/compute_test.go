package faker

import (
	"strings"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestFakeComputeDisplayName(t *testing.T) {
	displayNameFake := Compute().DisplayName()
	prefix := strings.Split(displayNameFake, "-")[0]
	assert.Contains(t, displayNames, prefix, prefix)
}

func TestFakeComputeSshPublicKey(t *testing.T) {
	sshPublicKey := Compute().SshPublicKey()
	assert.NotEmpty(t, sshPublicKey, "SshPublicKey should not be empty")
	assert.Contains(t, sshPublicKey, "ssh-rsa", "SshPublicKey should contain 'ssh-rsa' prefix")
	assert.Contains(t, sshPublicKey, "test-key-", "SshPublicKey should contain 'test-key-'")
}
