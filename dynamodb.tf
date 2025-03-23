resource "aws_dynamodb_table" "state-dynamodb-table" {
  name           = "state-dynamodb-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
 

  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags = {
    Name        = "state-dynamodb-table"
    Environment = "production"
  }
}
