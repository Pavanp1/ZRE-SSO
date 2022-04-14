provider "aws" {
  region = "us-east-1"
}


module "my-s3-bucket" {
  source = "git::https://github.com/Pavanp1/ZRE-SSO.git//modules/S3-bucket?ref=v1.0.0"

  bucket_name = "my-2601-terraform-bucket-for-test-1990"
  tags = {
    env = "Test"
    accesss = "private"
  }
}
