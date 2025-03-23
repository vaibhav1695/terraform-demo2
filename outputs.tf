
#output "aws_ec2_public_ip" {
#	value = aws_instance.my-instance[*].public_ip

#}

#output "aws_ec2_public_dns" {
#	value = aws_instance.my-instance[*].public_dns

#}

#output "aws_root_size" {
#	value = aws_instance.my-instance[*].root_block_device[*]
#
#}

output "aws_ec2_public_ip" {
  value = [
    for ip in aws_instance.my-instance : ip.public_ip
  ]
}
