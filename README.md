📄 CSV to Parquet Data Pipeline on AWS (Terraform + GitHub Actions)
📚 Project Overview
This project automates an event-driven data pipeline using AWS services.
When a CSV file is uploaded to the source S3 bucket, it automatically triggers a Lambda function that:

Converts the CSV file to Parquet format.

Uploads the Parquet file to the destination S3 bucket.

Sends a notification email via SNS (Simple Notification Service).

All AWS resources are provisioned and managed automatically using Terraform modules and CI/CD with GitHub Actions.

[User Uploads CSV to Source S3 Bucket]
                   ↓
         [S3 Event Notification]
                   ↓
            [AWS Lambda Function]
         - Converts CSV ➔ Parquet
         - Uploads to Destination S3
         - Publishes message to SNS
                   ↓
             [Email Notification]


🛠️ Technologies Used
AWS S3 (Source and Destination Buckets)

AWS Lambda (CSV ➔ Parquet conversion)

AWS SNS (Email Notification)

AWS IAM (Permissions and Role Management)

Terraform (Infrastructure as Code)

GitHub Actions (CI/CD for Terraform)



📦 Project Structure
bash
Copy
Edit
.
├── .github/
│   └── workflows/
│       └── terraform.yml         # GitHub Actions CI/CD pipeline
├── modules/
│   └── s3_lambda_sns/
│       ├── main.tf               # Terraform module main configuration
│       ├── variables.tf          # Module input variables
│       └── outputs.tf            # Module outputs (optional)
├── python/
│   └── lambda_function.py        # Lambda function to convert CSV to Parquet
├── main.tf                       # Root module to call s3_lambda_sns module
├── variables.tf                  # Root variables
├── terraform.tfvars              # Variables values
└── README.md                     # Project Documentation

🚀 Deployment Instructions
Clone the repository

bash
Copy
Edit
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
Configure your AWS credentials
(Make sure you are using a named profile if needed.)

Initialize Terraform

bash
Copy
Edit
terraform init
Review the plan

bash
Copy
Edit
terraform plan
Apply the configuration

bash
Copy
Edit
terraform apply -auto-approve
Verify

Upload a CSV file to the source S3 bucket.

Check the destination S3 bucket for the converted Parquet file.

Check your email for the notification.

Automated Deployment (CI/CD)
Every push to the GitHub repository triggers GitHub Actions to automatically apply the latest changes.

🎯 Key Highlights
Fully automated deployment with Terraform and GitHub Actions.

Clean modular design using Terraform modules.

Event-driven architecture with S3 triggers and Lambda.

Efficient data processing with CSV ➔ Parquet conversion.

Instant notifications via AWS SNS.

📧 Contact
Developer: [Your Full Name]
Email: [Your Email Address]
GitHub: [Your GitHub Profile Link]

✅ Status
Project Status: 100% Completed
Working: Successfully tested and verified.