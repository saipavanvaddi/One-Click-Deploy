$ErrorActionPreference = "Stop"

Write-Host "Deploying One-Click Solution..."
Set-Location -Path "$PSScriptRoot\..\terraform"

# Check if terraform is installed
if (-not (Get-Command terraform -ErrorAction SilentlyContinue)) {
    Write-Error "Terraform could not be found. Please install it."
    exit 1
}

terraform init
terraform apply -auto-approve

Write-Host "Deployment Complete!"
Write-Host "ALB DNS Name:"
terraform output -raw alb_dns_name
