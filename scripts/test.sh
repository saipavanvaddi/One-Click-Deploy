#!/bin/bash
set -e

cd "$(dirname "$0")/../terraform"
URL=$(terraform output -raw alb_dns_name)

if [ -z "$URL" ]; then
    echo "Could not get ALB DNS name. Is the stack deployed?"
    exit 1
fi

echo "Testing Application at http://$URL"
echo "-----------------------------------"
echo "GET /"
curl -s "http://$URL/"
echo ""
echo "-----------------------------------"
echo "GET /health"
curl -s -v "http://$URL/health"
