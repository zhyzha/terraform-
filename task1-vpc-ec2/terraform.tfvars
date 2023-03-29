#values.tf - file
# we renamed it so we could run terraform command without providing -var.file
#it will just pick up this values automatically

vpc_cidr                  = "10.10.0.0/16"
availability_zone_private = "us-east-1b"
cidr_block_private        = "10.10.2.0/24"
availability_zone_public  = "us-east-1a"
cidr_block_public         = "10.10.1.0/24"
instance_type             = "t2.micro"