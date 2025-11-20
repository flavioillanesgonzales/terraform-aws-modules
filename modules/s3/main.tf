resource "aws_s3_bucket" "main" {
  bucket = var.s3_name
  tags = {
    Name        = var.tag
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "main_acces" {
  bucket = aws_s3_bucket.main.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.main.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject"
        ]
        Resource = "${aws_s3_bucket.main.arn}/*"
      }
    ]
  })

  depends_on = [
    aws_s3_bucket_public_access_block.main_acces
  ]
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.main.bucket
  key    = "merida.jpg"
  source = "resource/merida.jpg"
}