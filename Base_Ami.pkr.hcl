packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "ami_prefix" {
  type    = string
  default = "ELK_Ami_Build-"
}
variable "ami_id" {
  type    = string
  default = "ami-0d70546e43a941d70"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
  
}

source "amazon-ebs" "ubuntu" {
  name          = "Elk_Base_Ami"
  ami_name      = "${var.ami_prefix}-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "eu-west-1"
  subnet_id     = "subnet-0fba7f10af2d68eac"
  vpc_id        = "vpc-0255296232bcc6eda"
  
  tags = {
    Base_AMI_Name = var.ami_id
    
  }
  
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name = "Base-Ami-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
   provisioner "shell" {

}
