# Terraform EC2  

## Overview

This repo contains Terraform configuration for AWS EC2 instance deployment

## Prerequesites

* Terraform
* AWS CLI

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

Remove configuration from servers
```bash
terraform destroy
```
