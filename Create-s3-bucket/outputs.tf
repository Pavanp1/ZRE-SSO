# Output definitions

output "bucket-arn" {
  description = "ARN of the bucket"
  value       = module.my-s3-bucket.arn
}

output "bucket-name" {
  description = "Name (id) of the bucket"
  value       = module.my-s3-bucket.name
}
