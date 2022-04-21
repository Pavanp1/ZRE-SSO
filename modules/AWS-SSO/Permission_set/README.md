This module is for creating permission sets


Example :

module "permission_set" {
  source = "../module"

  name = "AWS-SSO-IAM"
  description = "ec2 instance creation access"
  #session_duration = " "
  relay_state =  ""
  inline_policy = data.aws_iam_policy_document.ec2full-custom-policy.json
  managed_policies = ["arn:aws:iam::aws:policy/AWSDirectConnectReadOnlyAccess","arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"]
  tags = {
    Name = "testing module"
    created = "terraform"
  }

}
data "aws_iam_policy_document" "ec2full-custom-policy" {
  source_policy_documents = [file("../../../policies/policy1.json")]

}
