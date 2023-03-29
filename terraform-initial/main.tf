#Use data source to pull the AMI ID:
data "aws_ami" "amazon_linux_apache" {

  owners = ["self"]

  filter {
    name = "name"
    values = ["*apache*"]
  }
}
# Create a EC2 instance
resource "aws_instance" "terraform-lesson-1" {
    ami            = data.aws_ami.amazon_linux_apache.id
    instance_type  = var.my_instance_type
    associate_public_ip_address = true
    tags = {
        name = "homework-1-terraform"
        owner = "zhyldyz"
    }
}