resource "aws_s3_bucket" "bucket1" {
	bucket = "neeha-first-bucket"
}

resource "aws_s3_bucket" "bucket2" {
    
}

resource "aws_s3_bucket" "bucket3" {

}
resource "aws_s3_bucket" "bucket3" {
	bucket = "terraform-20240808093027585500000001"
}


provider "aws" {
    region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket         = "neeha-s3bucket-date"
    key            = "globalstate/s3/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "neeha-date-dblocks"
    encrypt        = true
  }
}
