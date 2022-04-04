# Terraform EC2  

## Overview

This repo contains Terraform configuration for AWS EC2 instance deployment

### Supported features
- EC2 deployment
- Security Group creation
- SSH Key import
- Tag assigment on instances/security groups/block devices

### Customizable parameters:
- AWS Provider settings (login by Acces & Secret keys or AWS CLI profile)
- SSH key to setup
- EC2 AMI (currently raw AMI ID supported)
- EC2 Storage type
- EC2 Instance type
- Secutiry Group exposed ports
- Tags (Name, Org) are currently supported

## Prerequesites

* Terraform
* AWS CLI
* Ansible

### Note on SSH connections

By default, password-protected (encrypted) private ssh keys are not supported in Terraform
But, if you use such key and some sort of ssh agent, you can set variable `ssh_agent_support = true` to utilize ssh agent

## Variables and  configuration

Copy `vars-example.tfvars` to `terraform.tfvars` or other `some-vars-file.tfvars` file
```bash
cp vars-example.tfvars terraform.tfvars
```
Adjust `.tfvars` file according to your needs


---

Terraform automatically loads a number of variable definitions files if they are present:
 - Files named exactly terraform.tfvars
 - Any files with names ending in .auto.tfvars

Or you can use option `-vars-file="new-production.tfvars"` to specify vars file in commands:
```bash
terraform apply -var-file="testing.tfvars"
```

## Usage and commands

Validate configuration
```bash
terraform validate
```

Show changes which will be applied 
```bash
terraform plan
```

Apply changes to servers
```bash
terraform apply
```

Show current applied configuration
```bash
terraform show
```

Remove configuration from servers
```bash
terraform destroy
```
