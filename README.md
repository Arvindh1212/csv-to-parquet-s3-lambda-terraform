# 🚀 AWS CSV to Parquet Data Pipeline (Terraform + GitHub Actions)

## 📖 Overview

This project implements a **serverless data pipeline** on **AWS**, fully managed with **Terraform** and automated by **GitHub Actions**.

- ✅ Upload a **CSV** to **Source S3 Bucket**
- ✅ **Lambda** function triggers automatically
- ✅ CSV is converted to **Parquet** format
- ✅ **Parquet** file is saved to **Destination S3 Bucket**
- ✅ **SNS Email Notification** is sent

All AWS resources are provisioned **dynamically** using **Terraform Modules**.

---

## 🧩 Architecture


---

## 🛠️ Tech Stack

| Technology              | Purpose                                  |
|--------------------------|------------------------------------------|
| **AWS S3**               | Store CSV and Parquet files              |
| **AWS Lambda**           | Convert CSV to Parquet                  |
| **AWS SNS**              | Email notifications                    |
| **AWS IAM**              | Roles and Policies                     |
| **Terraform**            | Infrastructure as Code                 |
| **GitHub Actions**       | CI/CD Automation                       |
| **Python (pandas, pyarrow)** | Data transformation               |

---

## 🗂️ Project Structure


---

## 🚀 Deployment Instructions

### 🖥️ Local Deployment

1. **Clone the Repository**

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO

Initialize Terraform

bash
Copy
Edit
terraform init
Validate the Code

bash
Copy
Edit
terraform validate
Plan Infrastructure

bash
Copy
Edit
terraform plan
Apply Infrastructure

bash
Copy
Edit
terraform apply -auto-approve
🤖 GitHub Actions Deployment
Pushing any changes to GitHub automatically triggers the Terraform workflow.

It runs:

terraform init

terraform plan

terraform apply

Fully automated with CI/CD!


✅ Features
Automatic trigger on new CSV uploads to S3

Converts CSV to Parquet format using Lambda

Stores converted files into Destination S3 Bucket

Sends SNS Email Notifications after successful processing

Infrastructure as Code using Terraform Modules

Fully automated deployment using GitHub Actions

📧 Contact Information
Name: Your Name
Email: your.email@example.com
GitHub: https://github.com/YOUR_USERNAME

