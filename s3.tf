
resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-tf-state-bucket-2304"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


