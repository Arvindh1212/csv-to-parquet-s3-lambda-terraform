provider "aws" {
  region  = "us-east-1"
}

module "s3_lambda_sns" {
  source = "./modules/s3_lambda_sns"

  source_bucket_name      = "csv-source-bucket-arvind-123"
  destination_bucket_name = "parquet-destination-bucket-arvind-123"
  lambda_function_name    = "csv-to-parquet-lambda"
  sns_topic_name          = "csv-to-parquet-lambda-topic"
  sns_email_address       = "arvindhsk1212@gmail.com"

  lambda_role_name        = "lambda_csv_to_parquet_exec_role_v6"
  lambda_policy_name      = "lambda_csv_to_parquet_policy_v6"

  lambda_timeout          = 300
  lambda_memory_size      = 512
}
