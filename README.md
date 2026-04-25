# CloudGuard IaC Pipeline

![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform&logoColor=white)
![Azure](https://img.shields.io/badge/Azure-0078D4?style=flat&logo=microsoftazure&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat&logo=githubactions&logoColor=white)

## Project Overview

An automated Azure infrastructure deployment pipeline built using Terraform and GitHub Actions CI/CD. This project extends the CloudGuard secure cloud infrastructure by automating the entire deployment process — eliminating manual portal clicks and human error.

Every time code is pushed to GitHub, the pipeline automatically deploys the complete Azure infrastructure using Terraform.

## Problem Statement

Manual Azure infrastructure deployment through the portal is time-consuming, error-prone, not repeatable across environments, and impossible to track changes or audit.

## Solution

Infrastructure as Code (IaC) using Terraform with automated CI/CD via GitHub Actions.

## Architecture

| Component | Technology |
|---|---|
| Cloud Platform | Microsoft Azure |
| Infrastructure as Code | Terraform |
| CI/CD Pipeline | GitHub Actions |
| Virtual Network | Azure VNet (10.0.0.0/16) |
| Public Subnet | 10.0.1.0/24 |
| Private Subnet | 10.0.2.0/24 |
| Security | NSG with SSH hardening (/32 CIDR) |

## What Gets Deployed

- Resource Group — cloudguard-rg
- Virtual Network — 10.0.0.0/16
- Public Subnet — 10.0.1.0/24
- Private Subnet — 10.0.2.0/24
- Network Security Group — SSH restricted to trusted IP
- NSG Association — attached to private subnet

## CI/CD Pipeline

The GitHub Actions pipeline triggers on every push to main branch:

1. Checkout code
2. Setup Terraform
3. Login to Azure using Service Principal
4. terraform init
5. terraform plan
6. terraform apply

## Project Structure

```
cloudguard-iac-pipeline/
├── main.tf                    # Provider and resource group
├── vnet.tf                    # Virtual Network and subnets
├── nsg.tf                     # Network Security Group
├── .github/
│   └── workflows/
│       └── terraform.yml      # CI/CD pipeline
└── .gitignore
```

## Skills Demonstrated

- Terraform IaC
- GitHub Actions CI/CD
- Azure Networking
- Security hardening
- GitOps workflow
- Automated infrastructure deployment

## Related Project

[CloudGuard — Enterprise Azure Secure Cloud Infrastructure](https://github.com/Prasanth0809/azure-secure-cloud-infrastructure)

## Author

Prasanth Panneer Selvam — Azure Cloud Engineer