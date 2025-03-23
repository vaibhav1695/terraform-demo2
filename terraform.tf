terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }



backend "s3" {

  bucket         = "my-tf-state-bucket-2304"
  key            = "terraform.tfstate"
  region         = "us-east-1"
  dynamodb_table = "state-dynamodb-table"

}
}
