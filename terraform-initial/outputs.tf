output "ami" {
  value = aws_instance.terraform-lesson-1.ami
}

output "instance_ip" {
  value = aws_instance.terraform-lesson-1.public_ip
}