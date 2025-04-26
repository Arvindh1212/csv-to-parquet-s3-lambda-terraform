terraform {
  backend "s3" {
    bucket         = "tfstate-new-pro"   # Replace with your actual bucket name
    key            = "state/terraform.tfstate"       # This is the path to the state file in the bucket
    region         = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
}

module "s3_lambda_sns" {
  source = "./modules/s3_lambda_sns"


  source_bucket_name      = var.source_bucket_name
  destination_bucket_name = var.destination_bucket_name
  lambda_function_name    = var.lambda_function_name
  sns_topic_name          = var.sns_topic_name
  sns_email_address       = var.sns_email_address
  lambda_role_name        = var.lambda_role_name
  lambda_policy_name      = var.lambda_policy_name
  lambda_timeout          = var.lambda_timeout
  lambda_memory_size      = var.lambda_memory_size


}

