terraform {
    backend "s3" {
        bucket  = "awsbucket-for-storing-tfstates-files"
        key     = "terraform.tfstate"
        region  = "us-east-1"
        encrypt = true
    }
}