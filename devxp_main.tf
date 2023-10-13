terraform {
  backend "s3" {
      bucket = "terraform-state-orb8rvjrv6mmm8hkoiyfluv5e8oc8sixaw3y7ek311lm1"
      key = "terraform/state"
      region = "us-west-2"
  }
}

resource "aws_instance" "len" {
      ami = data.aws_ami.ubuntu_latest.id
      instance_type = "t2.micro"
      tags = {
        Name = "len"
      }
      lifecycle {
        ignore_changes = [ami]
      }
}

resource "aws_iam_user" "len_iam" {
      name = "len_iam"
}

resource "aws_iam_user_policy_attachment" "len_iam_policy_attachment0" {
      user = aws_iam_user.len_iam.name
      policy_arn = aws_iam_policy.len_iam_policy0.arn
}

resource "aws_iam_policy" "len_iam_policy0" {
      name = "len_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.len_iam_policy_document.json
}

resource "aws_iam_access_key" "len_iam_access_key" {
      user = aws_iam_user.len_iam.name
}

data "aws_iam_policy_document" "len_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.len.arn]
      }
}

data "aws_ami" "ubuntu_latest" {
      most_recent = true
      owners = ["099720109477"]
      filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64*"]
      }
      filter {
        name = "virtualization-type"
        values = ["hvm"]
      }
}



