resource "aws_s3_bucket" "source_bucket" {
  bucket = var.source_bucket_name  # must be globally unique
}

resource "aws_s3_bucket" "destination_bucket" {
  bucket = var.destination_bucket_name # must be globally unique
}

# Zips the lambda source code
data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/python"
  output_path = "${path.module}/python/python.zip"
}

resource "aws_iam_role" "lambda_exec_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = var.lambda_policy_name
  role = aws_iam_role.lambda_exec_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
                {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::csv-source-bucket-arvind-123",
                "arn:aws:s3:::csv-source-bucket-arvind-123/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject"
            ],
            "Resource": [
                "arn:aws:s3:::parquet-destination-bucket-arvind-123",
                "arn:aws:s3:::parquet-destination-bucket-arvind-123/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
    {
            "Effect": "Allow",
      "Action": "sns:*",
      "Resource": "*"
    }
  ]
})
}





resource "aws_lambda_function" "csv_to_parquet_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "python.lambda_handler"
  runtime       = "python3.11"
  timeout       = var.lambda_timeout
  layers        = ["arn:aws:lambda:us-east-1:336392948345:layer:AWSSDKPandas-Python311:20"]

  filename         = data.archive_file.zip_the_python_code.output_path
  source_code_hash = data.archive_file.zip_the_python_code.output_base64sha256
  environment {
    variables = {
      DEST_BUCKET = aws_s3_bucket.destination_bucket.bucket
      SNS_TOPIC_ARN = aws_sns_topic.lambda_notifications.arn
    }
  }

  depends_on = [aws_iam_role_policy.lambda_policy]
  
}

resource "aws_lambda_permission" "allow_s3_invoke" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.csv_to_parquet_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.source_bucket.arn
}

resource "aws_s3_bucket_notification" "source_trigger" {
  bucket = aws_s3_bucket.source_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.csv_to_parquet_lambda.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".csv"
  }

  depends_on = [aws_lambda_permission.allow_s3_invoke]
}

resource "aws_sns_topic" "lambda_notifications" {
  name = var.sns_topic_name
}


resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.lambda_notifications.arn
  protocol  = "email"
  endpoint  = var.sns_email_address # Replace with your real email
}
