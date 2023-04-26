terraform {
    backend "s3" {
        bucket  = "awsbucket-for-storing-tfstates-files"
        key     = "project2-asg-lb.tfstate"
        region  = "us-east-1"
        encrypt = true
    }
}