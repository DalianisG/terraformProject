terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }

  required_version = ">= 0.15"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

# Bucket creation
resource "aws_s3_bucket" "my_protected_bucket" {
  bucket = var.bucket_name
}

# Creating Lifecycle Rule
resource "aws_s3_bucket_lifecycle_configuration" "my_protected_bucket_lifecycle_rule" {
  # Must have bucket versioning enabled first
  bucket = aws_s3_bucket.my_protected_bucket.bucket

  rule {
    id     = "basic_config"
    status = "Enabled"

    filter {
      prefix = "config/"
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = 60
      storage_class   = "GLACIER"
    }

    noncurrent_version_expiration {
      noncurrent_days = 90
    }
  }
}

# Disabling bucket public access
resource "aws_s3_bucket_public_access_block" "my_protected_bucket_access" {
  bucket = aws_s3_bucket.my_protected_bucket.id

  # Block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Create a new SNS topic
resource "aws_sns_topic" "my_topic" {
  name = var.sns_topic_name
}

# Grant S3 permission to publish to SNS topic
resource "aws_sns_topic_policy" "sns_policy" {
  arn = aws_sns_topic.my_topic.arn

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowS3Publish",
        Effect    = "Allow",
        Principal = "*",
        Action    = "sns:Publish",
        Resource  = aws_sns_topic.my_topic.arn,
        Condition = {
          ArnLike = {
            "aws:SourceArn" = aws_s3_bucket.my_protected_bucket.arn
          }
        }
      }
    ]
  })
}

# Set up S3 bucket notification to trigger SNS topic
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.my_protected_bucket.id

  topic {
    topic_arn = aws_sns_topic.my_topic.arn
    events    = ["s3:ObjectCreated:*"]
  }
}

# Subscribe an email adress to the SNS topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "email"
  endpoint  = var.sns_email
}
