policytest {
  targets = ["provider-version.policy.hcl"]
}

provider "aws" "approved" {
  meta = {
    source  = "registry.terraform.io/hashicorp/aws"
    version = "5.1.0"
  }
}

provider "aws" "unofficial_source" {
  expect_failure = true
  meta = {
    source  = "registry.terraform.io/acme-corp/aws"
    version = "5.1.0"
  }
}

provider "aws" "old_version" {
  expect_failure = true
  meta = {
    source  = "registry.terraform.io/hashicorp/aws"
    version = "3.76.1"
  }
}
