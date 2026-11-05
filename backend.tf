terraform {
  backend "s3" {
    bucket       = "hypha-demo12345678"
    key          = "aws-terraform-sample/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
