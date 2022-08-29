data "aws_vpc" "Elk_vpc" {
  filter {
    name   = "tag:Name"
    values = ["lab_vpc"]
  }
}

#Data resource for the bastionhost

data "aws_ami" "Bastion_Host" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

#Data resource for the Kibana_server
data "aws_ami" "Kibana_server" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "Es_server" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "Demo_Server" {
  most_recent = true


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "Logstash_server" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_subnet" "public_a" {
  filter {
    name   = "tag:Name"
    values = ["Public_Subnet_a"]
  }
}
data "aws_subnet" "private_a" {
  filter {
    name   = "tag:Name"
    values = ["Private_Subnet_a"]
  }
}
data "aws_subnet" "private_b" {
  filter {
    name   = "tag:Name"
    values = ["Private_Subnet_b"]
  }
}
data "aws_subnet" "private_c" {
  filter {
    name   = "tag:Name"
    values = ["Private_Subnet_c"]
  }
}