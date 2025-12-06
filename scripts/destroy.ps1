$ErrorActionPreference = "Stop"

Write-Host "Destroying One-Click Solution..."
Set-Location -Path "$PSScriptRoot\..\terraform"

terraform destroy -auto-approve

Write-Host "Teardown Complete!"
