data "aws_vpc" "default" {
  default = true
}
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
module "kms" {
  source       = "./modules/kms"
  project_name = var.project_name
}
module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
  kms_key_arn  = module.kms.key_arn
}
module "ec2" {
  source        = "./modules/ec2"
  project_name  = var.project_name
  instance_type = var.instance_type
  vpc_id        = data.aws_vpc.default.id
  vpc_cidr      = data.aws_vpc.default.cidr_block
  subnet_id     = sort(data.aws_subnets.default.ids)[0]
  kms_key_arn   = module.kms.key_arn
}
