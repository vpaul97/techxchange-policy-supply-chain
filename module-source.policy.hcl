module_policy "*" "private_registry_only" {
  enforce {
    condition     = core::startswith(meta.source, "app.terraform.io/vpaul_test/")
    error_message = "Module source '${meta.source}' is not approved. Use the private registry: app.terraform.io/vpaul_test/."
  }
}
