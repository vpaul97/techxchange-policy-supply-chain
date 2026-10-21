policytest {
  targets = ["module-source.policy.hcl"]
}

module "app.terraform.io/vpaul_test/s3-bucket/aws" "private_registry" {
  meta = {
    source  = "app.terraform.io/vpaul_test/s3-bucket/aws"
    version = "1.0.0"
  }
}

module "terraform-aws-modules/s3-bucket/aws" "public_registry" {
  expect_failure = true
  meta = {
    source  = "terraform-aws-modules/s3-bucket/aws"
    version = "4.1.0"
  }
}

module "./modules/bucket" "local_path" {
  expect_failure = true
  meta = {
    source = "./modules/bucket"
  }
}
