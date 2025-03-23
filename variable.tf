
variable "aws_ec2_type" {
  default = "t2.micro"
  type    = string
}

variable "aws_ec2_ami" {
  default = "ami-084568db4383264d4"
  type    = string
}


variable "ec2_root_default_size" {
  default = 8
  type    = number

}

variable "env" {
  default = "dev"
  type    = string
}
