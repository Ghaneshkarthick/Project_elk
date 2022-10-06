terraform {
    backend "s3" {
        bucket = "ta-labbucket"
        key = "ta-labbucket/ELK_lab/terraform.tfstates"
        region = "eu-west-1"
        dynamodb_table = "terraform-lock"
  }
}

