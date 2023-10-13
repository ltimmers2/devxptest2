resource "aws_s3_bucket" "terraform_backend_bucket" {
      bucket = "terraform-state-orb8rvjrv6mmm8hkoiyfluv5e8oc8sixaw3y7ek311lm1"
}

terraform {
  required_providers {
    aws =  {
    source = "hashicorp/aws"
    version = ">= 2.7.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
}

