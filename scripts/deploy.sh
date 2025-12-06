#!/bin/bash
set -e

echo "Deploying One-Click Solution..."
cd "$(dirname "$0")/../terraform"

# Check if terraform is installed
if ! command -v terraform &> /dev/null; then
    echo "Terraform could not be found. Please install it."
    exit 1
fi

terraform init
terraform apply -auto-approve

echo "Deployment Complete!"
echo "ALB DNS Name:"
terraform output -raw alb_dns_name
