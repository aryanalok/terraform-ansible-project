resource "aws_s3_bucket" "terra-bucket" {

    bucket = "${var.env}-terra-ans-bucket"

    tags = {
      Name = "${var.env}-terra-ans-bucket"
      Environment = var.env
    }
  
}