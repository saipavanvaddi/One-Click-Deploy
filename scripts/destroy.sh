#!/bin/bash
set -e

echo "Destroying One-Click Solution..."
cd "$(dirname "$0")/../terraform"

terraform destroy -auto-approve

echo "Teardown Complete!"
