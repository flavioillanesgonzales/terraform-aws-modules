
module "aws_s3_bucket" {
  source  = "flavioillanesgonzales/modules/aws//modules/s3"
  version = "1.0.0"
  s3_name = var.s3_name
  tag = var.tag
  environment = var.environment
}