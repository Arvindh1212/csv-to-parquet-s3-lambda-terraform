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

## 🌟 Features

- 📥 **S3 Event Trigger**: Upload CSV files to automatically trigger the Lambda.
- 🔄 **Lambda Conversion**: Lambda function converts CSV to Parquet format.
- 📤 **S3 Storage**: Saves converted Parquet files to destination bucket.
- 📧 **SNS Notifications**: Sends an email notification after successful conversion.
- 🏗️ **Infrastructure as Code**: All AWS resources are managed through Terraform.
- ⚡ **Continuous Deployment**: Automated CI/CD with GitHub Actions.

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

