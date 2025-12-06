# One-Click DevOps Assignment

This repository contains a "One-Click Deployment" solution for a simple REST API on AWS using Terraform.

## Architecture
- **VPC**: 2 Public Subnets, 2 Private Subnets.
- **Networking**: Internet Gateway, NAT Gateway.
- **Load Balancing**: Public ALB forwarding to an Auto Scaling Group.
- **Compute**: Private EC2 instances (Amazon Linux 2023) running a Python Flask app.
- **Security**: Minimal Security Groups, IAM Roles with SSM support.

## Prerequisites
- AWS CLI configured with appropriate credentials.
- Terraform installed (v1.0+).
- Bash shell (Git Bash on Windows, or native Linux/macOS).

## Directory Structure
- `app/`: Python Flask application code.
- `terraform/`: Terraform Infrastructure as Code.
- `scripts/`: Helper scripts for lifecycle management.

## Usage

### 1. Deploy
Run the deployment script:
```bash
./scripts/deploy.sh
```
This will initialize Terraform and apply the configuration. It usually takes 3-5 minutes (mainly for NAT Gateway creation).

### 2. Test
Once deployed, verify the application:
```bash
./scripts/test.sh
```
This will query the ALB DNS name for the root `/` and `/health` endpoints.

### 3. Teardown
To destroy all resources and avoid charges:
```bash
./scripts/destroy.sh
```

## Manual Steps (if scripts fail)
1. Navigate to `terraform/` directory.
2. Run `terraform init`.
3. Run `terraform apply`.
4. Note the `alb_dns_name` output.
5. Access `http://<alb_dns_name>/` in your browser.
