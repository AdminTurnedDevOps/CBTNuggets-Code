// To run this test, you will need Golang installed and the Terraform module installed.
// To install Golang, look at the install-go.sh file found in this directory
// To install a module, run "go get github.com/gruntwork-io/terratest/modules/terraform"

// To run the test, run: go test -v vnet_test.go

package test

import (
  "github.com/gruntwork-io/terratest/modules/terraform"
  "testing"
)


func vnet_test(t *testing.T) {

    terraformOptions := &terraform.Options{
    }

    defer terraform.Destroy(t, terraformOptions)

    terraform.InitAndApply(t, terraformOptions)

}