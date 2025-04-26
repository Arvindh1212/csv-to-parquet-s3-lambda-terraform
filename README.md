# 📦 CSV to Parquet S3 Pipeline | Terraform, Lambda, SNS, GitHub Actions

---

## 🚀 Project Overview

Welcome! This project automatically converts CSV files uploaded to an S3 bucket into Parquet format using an AWS Lambda function. The converted files are then stored in another S3 bucket, and an SNS email notification is sent upon successful conversion. All of this is Infrastructure as Code (IaC) managed by Terraform and deployed automatically with GitHub Actions.

---

## 🛠️ Quickstart Guide

### Initialize Terraform
```bash
terraform init
```

### Validate Terraform Code
```bash
terraform validate
```

### Plan Infrastructure Changes
```bash
terraform plan
```

### Apply and Deploy Infrastructure
```bash
terraform apply -auto-approve
```

---

## 🤖 GitHub Actions CI/CD Pipeline

Every push to the `main` branch triggers an automated workflow that runs:
- `terraform init`
- `terraform plan`
- `terraform apply`

✅ **Fully automated deployments!**

---


---

## 📂 Project Structure

```bash
.
├── modules/
│   └── s3_lambda_sns/     # Terraform module with all resources
├── python/                # Lambda function source code
├── .github/workflows/     # GitHub Actions workflow files
├── main.tf                # Root Terraform configuration
├── variables.tf           # Variables for Terraform
├── outputs.tf             # Terraform Outputs
└── README.md              # Project Documentation
```

---

## 📧 Contact Information

- **Name:** Arvindh S
- **Email:** arvindh.your@email.com
- **GitHub:** [github.com/Arvindh1212](https://github.com/Arvindh1212)

---

## 🎯 Project Status

✅ **Deployment Successful** | ✅ **Tested End-to-End** | ✅ **Production-Ready**

---

## 🙏 Thank You!

Thank you for checking out this project. Feel free to connect if you have questions or suggestions! ✨



# 📚 CSV to Parquet Data Pipeline on AWS (Terraform + GitHub Actions)

---

## 📙 Project Overview

This project automates an event-driven data pipeline using AWS services.
When a CSV file is uploaded to the source S3 bucket, it automatically triggers a Lambda function that:

- Converts the CSV file to Parquet format.
- Uploads the Parquet file to the destination S3 bucket.
- Sends a notification email via SNS (Simple Notification Service).

All AWS resources are provisioned and managed automatically using Terraform modules and CI/CD with GitHub Actions.

---

## ⚡ Architecture

```
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
```

---

## 🛠️ Technologies Used

- **AWS S3** (Source and Destination Buckets)
- **AWS Lambda** (CSV ➔ Parquet conversion)
- **AWS SNS** (Email Notification)
- **AWS IAM** (Permissions and Role Management)
- **Terraform** (Infrastructure as Code)
- **GitHub Actions** (CI/CD for Terraform)

---

## 📦 Project Structure

```
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
```

---

## 🚀 Deployment Instructions

### Clone the repository

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### Configure your AWS credentials
*(Make sure you are using a named profile if needed.)*

### Initialize Terraform

```bash
terraform init
```

### Review the plan

```bash
terraform plan
```

### Apply the configuration

```bash
terraform apply -auto-approve
```

### Verify

- Upload a CSV file to the source S3 bucket.
- Check the destination S3 bucket for the converted Parquet file.
- Check your email for the notification.

---

## 💪 Automated Deployment (CI/CD)

Every push to the GitHub repository triggers GitHub Actions to automatically apply the latest changes.

---

## 🌟 Features

- 📥 **S3 Event Trigger**: Upload CSV files to automatically trigger the Lambda.
- 🔄 **Lambda Conversion**: Lambda function converts CSV to Parquet format.
- 📤 **S3 Storage**: Saves converted Parquet files to destination bucket.
- 📧 **SNS Notifications**: Sends an email notification after successful conversion.
- 🏗️ **Infrastructure as Code**: All AWS resources are managed through Terraform.
- ⚡ **Continuous Deployment**: Automated CI/CD with GitHub Actions.


---

## 📧 Contact

- **Developer:** [Your Full Name]
- **Email:** [Your Email Address]
- **GitHub:** [Your GitHub Profile Link]

---

## ✅ Status

- **Project Status:** 100% Completed
- **Working:** Successfully tested and verified.

---


# 🎉 Thank you for reviewing this project!

