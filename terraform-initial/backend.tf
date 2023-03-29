terraform {
    backend "s3" {
        bucket  = "terraform-tfstate-lockfile"
        key     = "tfstate"
        region  = "us-east-1"
        encrypt = true
        dynamodb_table = "terraform_tfstate"
    }
}