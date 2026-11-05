variable "project_name" {
  description = "Lowercase name used in resource names"
  type        = string
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
variable "vpc_id" {
  description = "VPC for the security group"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR allowed for outbound HTTPS"
  type        = string
}
variable "subnet_id" {
  description = "Subnet for the instance"
  type        = string
}
variable "kms_key_arn" {
  description = "KMS key used to encrypt the root volume"
  type        = string
}
