variable "source_bucket_name" {
  description = "Name of the source S3 bucket"
  type        = string
}

variable "destination_bucket_name" {
  description = "Name of the destination S3 bucket"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "sns_email_address" {
  description = "Email address for SNS subscription"
  type        = string
}

variable "lambda_role_name" {
  description = "Name of the IAM role for Lambda function"
  type        = string
}

variable "lambda_policy_name" {
  description = "Name of the IAM policy attached to Lambda role"
  type        = string
}

variable "lambda_timeout" {
  description = "Timeout (in seconds) for the Lambda function"
  type        = number
  default     = 300
}

variable "lambda_memory_size" {
  description = "Memory size (MB) for the Lambda function"
  type        = number
  default     = 512
}
