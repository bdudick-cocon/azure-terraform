#############################################################################
# PROVIDERS
#############################################################################

# The simple project that we are going to be contructing today will
# use a single directory to hold our infrastructure resource definitions.  
# When a Terrafrom command is issued, the runtime will scan the directory and 
# look for files the end in .tf. The first thing that it needs to do is establish what
# Providers are goign to be used so it can make the correct API calls. In this instance,
# our primary provider is Azure. When we run terraform init, Terraform will download a 
# provider exe which are explicitly defined. In our case, the Terraform Azure provider 
# will be downloaded. If we add additional providers, we would need to reinitialize
# the project by running terraform init again. 
#############################################################################

## Define Terraform provider
terraform {
  required_version = ">= 0.12"
}

## Configure the Azure provider
provider "azurerm" {
  version         = "~> 1.44.0"
  environment     = "public"
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

## Configure the Azure AD provider
provider "azuread" {

}

data "azuread_user" "current_azuread_user_upn" {
  user_principal_name = var.current_azuread_user_upn
}

#############################################################################
# RESOURCES
# Resources are Azure infrastructure constructs and can be IaaS service or PaaS
# Services. Hashi Corp Configuration Language, HCL, is decalaritive, so the basic
# pattern is to set the resource type with proprerties and let the provider do the 
# work behind the sceenes.
#############################################################################
resource azurerm_resource_group "primary_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

################################################################################
# Now that we have a basic 'hello world' together for terraform, let's run the following
# 1) ctrl+s to save our file in Code
# 2) ctrl+x to exit Code
# 3) terraform init
###############################################################################

###############################################################################
# Now that we have our project initialized and our providers downloaded, our 
# basic pattern development pattern with Terraform is going to be:
# 1) Write some HCL. Then, run
# 2) terraform plan
# 3) terraform apply

