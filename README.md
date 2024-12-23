# uptime-kuma-project
# Obelion Terraform Project
![image](https://github.com/user-attachments/assets/6b8402d3-8a4c-4806-94ab-2094bfca3c85)
# 16 resources created  

This repository contains Terraform configurations to provision various AWS resources and infrastructure components, including S3 for storing Terraform state files, EC2 instances, RDS, networking components, and CloudWatch for monitoring.
rds is connected to backend ec2 

## 🚀 Project Overview

The project aims to automate the setup of a secure and scalable infrastructure using **Terraform**. This includes setting up:
- **S3** for storing Terraform state files 
- **dynamodb** for enabling state locking
- **Network module** with VPC, subnets, route tables, internet gateway, and security groups
- **EC2 modules** for both frontend and backend application servers
- **RDS** for managed relational database service
- **CloudWatch** for monitoring and logging infrastructure metric
- **sns** for email
![image](https://github.com/user-attachments/assets/226fca0c-5f5f-4d6a-a365-7df4f19ae83f)
![image](https://github.com/user-attachments/assets/a93620c5-d136-40b6-b8ac-b93f6ea59d8c)
![image](https://github.com/user-attachments/assets/59a51566-d318-45e2-9f30-8f5858c7097f)
![image](https://github.com/user-attachments/assets/c7ca5de2-a105-49ba-a54f-c0b14979559e)
![image](https://github.com/user-attachments/assets/eca1dd52-916a-416d-ac17-e6f797b65c8d)
![image](https://github.com/user-attachments/assets/f8b350a8-60e4-41c0-b21c-e7412f25baa9)



frontend work on http://44.201.107.105:3001/

backend work on http://3.83.109.199:3001/
