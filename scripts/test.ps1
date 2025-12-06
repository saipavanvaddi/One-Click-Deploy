$ErrorActionPreference = "Stop"

Set-Location -Path "$PSScriptRoot\..\terraform"
$URL = terraform output -raw alb_dns_name

if ([string]::IsNullOrWhiteSpace($URL)) {
    Write-Error "Could not get ALB DNS name. Is the stack deployed?"
    exit 1
}

Write-Host "Testing Application at http://$URL"
Write-Host "-----------------------------------"
Write-Host "GET /"
Invoke-RestMethod -Uri "http://$URL/" -Method Get
Write-Host ""
Write-Host "-----------------------------------"
Write-Host "GET /health"
try {
    $response = Invoke-WebRequest -Uri "http://$URL/health" -Method Get
    Write-Host "Status Code: $($response.StatusCode)"
    Write-Host "Content: $($response.Content)"
} catch {
    Write-Error "Health check failed: $_"
}
