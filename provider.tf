provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Optionally, you can use environment variables for authentication
# environment variable AZURE_CLIENT_ID, AZURE_CLIENT_SECRET, AZURE_TENANT_ID, AZURE_SUBSCRIPTION_ID
