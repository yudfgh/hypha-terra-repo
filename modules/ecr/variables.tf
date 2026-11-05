variable "project_name" {
  description = "Lowercase name used in resource names"
  type        = string
}
variable "kms_key_arn" {
  description = "KMS key used to encrypt images"
  type        = string
}
