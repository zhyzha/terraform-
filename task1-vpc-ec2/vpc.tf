#create the vpc, igw, subnets
#1 vpc
#2 igw
#subnets(1 public, 1 private)
#route table
#route table association

resource "aws_vpc" "vpc1" {
    cidr_block = var.vpc_cidr
    tags = {
      Owner = "zhyldyz"
    }
}

resource "aws_internet_gateway" "vpc1_igw" {
    vpc_id = aws_vpc.vpc1.id

    tags = {
      Owner = "zhyldyz"
    }

    depends_on = [aws_vpc.vpc1]  #depends_on -- tellsTerraform to complete the aws_vpc.vpc1 resource creation first before starting this one 
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.cidr_block_public
    availability_zone = var.availability_zone_public
    tags = {
      Owner = "zhyldyz"
    }
    depends_on = [aws_vpc.vpc1]

}
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.cidr_block_private
    availability_zone = var.availability_zone_private
    tags = {
      Owner = "zhyldyz"
    }
    depends_on = [aws_vpc.vpc1]
}

#create Route Tables and Associations

resource "aws_default_route_table" "internet_gateway_rt" {
    default_route_table_id = aws_vpc.vpc1.main_route_table_id

#put all the traffic from my VPC to the world - open the traffic
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.vpc1_igw.id
    }

    tags = {
        Owner = "zhyldyz"
    }

    depends_on = [aws_vpc.vpc1]
}

resource "aws_route_table_association" "internet_gateway_rt_association" {
    subnet_id = aws_subnet.public_subnet.id

    route_table_id = aws_vpc.vpc1.main_route_table_id

    depends_on = [aws_subnet.public_subnet]
}