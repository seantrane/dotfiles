// https://github.com/terraform-linters/tflint/blob/master/docs/user-guide/config.md
config {
  module = false
  force = false
}

# plugin "aws" {
#   enabled = true
# }

rule "terraform_module_pinned_source" {
  enabled = false
}
