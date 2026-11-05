terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
resource "aws_kms_key" "this" {
  description             = "${var.project_name} encryption key"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}
resource "aws_kms_alias" "this" {
  name          = "alias/${var.project_name}-key"
  target_key_id = aws_kms_key.this.key_id
}
