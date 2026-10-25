policy {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0, < 6.0.0"
    }
  }
}

provider_policy "aws" "approved_source" {
  enforce {
    condition     = meta.source == "registry.terraform.io/hashicorp/aws"
    error_message = "Provider source '${meta.source}' not approved."
  }
}

provider_policy "aws" "version_check" {
  enforcement_level = "mandatory"

  enforce {
    condition     = core::semverconstraint(meta.version, ">= 4.0.0, < 6.0.0")
    error_message = "AWS provider must be >= 4.0.0 and < 6.0.0. Found: ${meta.version}"
  }
}
