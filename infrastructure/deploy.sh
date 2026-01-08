#!/bin/bash

# Azure Infrastructure Deployment Script
# Deploys ARM templates using Azure CLI

set -e

RESOURCE_GROUP="rg-etl-portfolio"
LOCATION="eastus"
ENVIRONMENT=$1

if [ -z "$ENVIRONMENT" ]; then
    echo "Usage: ./deploy.sh [dev|test|prod]"
    exit 1
fi

echo "==========================================="
echo "Deploying infrastructure for: $ENVIRONMENT"
echo "==========================================="

# Create resource group if it doesn't exist
echo "Creating resource group..."
az group create \
    --name "${RESOURCE_GROUP}-${ENVIRONMENT}" \
    --location "$LOCATION" \
    --tags environment="$ENVIRONMENT" project="etl-portfolio"

# Deploy storage account
echo "Deploying storage account..."
az deployment group create \
    --resource-group "${RESOURCE_GROUP}-${ENVIRONMENT}" \
    --template-file arm-templates/storage-account.json \
    --parameters arm-templates/storage-account.parameters.${ENVIRONMENT}.json

echo "==========================================="
echo "Deployment completed successfully!"
echo "==========================================="
