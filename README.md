# uptime-kuma-project
# Obelion Terraform Project

This repository contains Terraform configurations to provision various AWS resources and infrastructure components, including S3 for storing Terraform state files, EC2 instances, RDS, networking components, and CloudWatch for monitoring.
rds is connected to backend ec2 

## 🚀 Project Overview

The project aims to automate the setup of a secure and scalable infrastructure using **Terraform**. This includes setting up:
- **S3** for storing Terraform state files and enabling state locking
- **Network module** with VPC, subnets, route tables, internet gateway, and security groups
- **EC2 modules** for both frontend and backend application servers
- **RDS** for managed relational database service
- **CloudWatch** for monitoring and logging infrastructure metric
- **sns** for email
![image](https://github.com/user-attachments/assets/226fca0c-5f5f-4d6a-a365-7df4f19ae83f)
![image](https://github.com/user-attachments/assets/a93620c5-d136-40b6-b8ac-b93f6ea59d8c)
![image](https://github.com/user-attachments/assets/59a51566-d318-45e2-9f30-8f5858c7097f)
![image](https://github.com/user-attachments/assets/c7ca5de2-a105-49ba-a54f-c0b14979559e)

frontend work on http://44.201.107.105:3001/

backend work on http://3.83.109.199:3001/
