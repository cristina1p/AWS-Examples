terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2" # Match your preferred region
}

resource "aws_s3_bucket" "my_tf_bucket" {
  bucket = "my-tf-bucket-12345678" # Must be globally unique across all AWS accounts

  tags = {
    Name        = "My Terraform S3 Bucket"
    Environment = "Dev"
  }
}