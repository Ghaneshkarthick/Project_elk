data "aws_vpc" "Elk_vpc" {
    filter {
    name   = "tag:Name"
    values = ["lab_vpc"]
  }
}