output "name" {
  value = aws_s3_bucket.main.bucket
}

output "id_bucket" {
  value = aws_s3_bucket.main.id
}

output "region_bucket" {
  value = aws_s3_bucket.main.region
}