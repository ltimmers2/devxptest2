terraform {
  backend "s3" {
      bucket = "terraform-state-orb8rvjrv6mmm8hkoiyfluv5e8oc8sixaw3y7ek311lm1"
      key = "terraform/state"
      region = "us-west-2"
  }
}





