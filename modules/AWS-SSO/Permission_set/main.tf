locals {
  metadata = {
    package = "terraform-aws-account"
   # version = trimspace(file("${path.module}"))
    module  = basename(path.module)
    name    = var.name
  }
#     module_tags = var.module_tags_enabled ? {
#     "module.terraform.io/package"   = local.metadata.package
#    # "module.terraform.io/version"   = local.metadata.version
#     "module.terraform.io/name"      = local.metadata.module
#     "module.terraform.io/full-name" = "${local.metadata.package}/${local.metadata.module}"
#     "module.terraform.io/instance"  = local.metadata.name
#   } : {}

}

data "aws_ssoadmin_instances" "this" {}

locals {
  sso_instance_arn = tolist(data.aws_ssoadmin_instances.this.arns)[0]
}


resource "aws_ssoadmin_permission_set" "this" {
  name         = var.name
  description  = var.description
  instance_arn = local.sso_instance_arn

  session_duration = var.session_duration

  tags = merge(
    {
      "Name" = local.metadata.name
    },
#     var.tags,
  )
}


###################################################
# AWS Managed Policies
###################################################

resource "aws_ssoadmin_managed_policy_attachment" "this" {
  for_each = toset(var.managed_policies)

  instance_arn       = aws_ssoadmin_permission_set.this.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.this.arn

  managed_policy_arn = each.key
}


###################################################
# Custom Permissions Policy
###################################################

resource "aws_ssoadmin_permission_set_inline_policy" "this" {
  count = var.inline_policy != null ? 1 : 0

  instance_arn       = aws_ssoadmin_permission_set.this.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
  inline_policy      = var.inline_policy
}
