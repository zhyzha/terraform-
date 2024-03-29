resource "aws_security_group" "allow_ssh_and_http" {
    name   = "allow_ssh_and_http"
    vpc_id =  aws_vpc.vpc1.id

    ingress {
        description = "allow SSH"
        from_port    = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "allow HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"              #semantically "-1" = all
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Owner = "zhyldyz"
    }

}