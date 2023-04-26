resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_name
    acl = "private"
    versioning {
      enabled = true 
    }

    tags = {
      managed-by = "terraform"
    }
}
resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
    bucket = aws_s3_bucket.bucket.id

    rule {
      id = "my_rule"

      transition {
            days = 30
            storage_class = "STANDARD_IA"
        }
      transition {
            days = 60
            storage_class = "GLACIER"
        }
    status = "Enabled"
   } # prevent_destroy = true   #preventing to delete accidentially our bucket by someone 
}





