
resource "aws_default_vpc" "main" {
  tags = {
    Name = "my-VPC"
  }
}

resource "aws_security_group" "my-sg" {
  name        = "my-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.main.id

  tags = {
    Name = "My-sg"
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "port open for SSH"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "port open for http"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "port open for outbound traffic"
  }

}


resource "aws_instance" "my-instance" {

  #  count = 2   
  for_each = tomap({
    vaibhav_micro = "t2.micro"
    vishal_micro  = "t2.micro"
  })

  ami                    = var.aws_ec2_ami # us-west-2
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  user_data              = file("script.sh")

  root_block_device {
    volume_size = var.env == "prod" ? 10 : var.ec2_root_default_size
    volume_type = "gp3"
  }

  tags = {
    Name = "web-server"
  }

}


