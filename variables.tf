variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "george-5555555"

  validation {
    condition = length(var.bucket_name) > 2 && length(var.bucket_name) < 64 && can(regex("^[0-9A-Za-z-]+$", var.bucket_name))
    error_message = "The bucket_name must follow naming rules. Check them out at: https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html."
  }
}