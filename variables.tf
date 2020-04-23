#############################################################################
# VARIABLES
#############################################################################

#############################################################################
# Subscription Resources
#############################################################################

## Your Azure Tenant ID from terraform.tfvars
variable "tenant_id" {
  description = "The tenant id for your Azure Account."
  type        = string
}

## Your Azure Subscription ID for creating resources from terraform.tfvars
variable "subscription_id" {
  description = "The subscription id for the resource that you will proivision."
  type        = string
}

/*
We are mainly using the Azure AD User Principal Name as a workaround to create an access policy for the Azure Key Vault.
When you run this project from a local development machine, the UPN object id will be found and the solution works without issue.
However, when you run it from Azure Cloud Shell it chokes ans will generate an error unless you use this workaround
and combine it with the tenant id and subscription id variables below. If you try to use the base az cli and terraform config,
you will get: 
Error: expected "access_policy.0.object_id" to be a valid UUID. 
See this issue:
https://github.com/terraform-providers/terraform-provider-azurerm/issues/2901
*/

## from terraform.tfvars

variable "current_azuread_user_upn" {
  description = "the user prinnipal name for associated with you subscription "
  type        = string
}

#############################################################################
# Management Resources
#############################################################################

## The name of the resource group that for our resources
variable "resource_group_name" {
  description = "The primary resource group for infrastructure deployment."
  type        = string
  default     = "cc-ll-rg"
}

## The Azure Region where we want to deploy resources
variable "location" {
  description = "The Azure Region where we will perform deployments"
  type        = string
  default     = "eastus2"
}

variable "tags" {
  description = "Standard tags that will get applied to resources."
  type        = map
  default = {
    Region           = "eastus2"
    ApplicationName  = "Lunch and Learn"
    POC              = "Jim Smith"
    BudgetAmount     = "0.00"
    InitiativeName   = "Training"
    DisasterRecovery = "None"
    Environment      = "Test"
    Compliance       = "None"
    StartSchedule    = "0 7 * * 1_5"
    StopSchedule     = "0 19 * * 1_5"
  }
}

#############################################################################
# Key Vault Resources
#############################################################################

variable "key_vault_name" {
  description = "Management Key Vault for secrets"
  type        = string
  default     = "cc-ll-kv"
}

variable "key_vault_admin_secret_password_name" {
  description = "Management Key Vault for secrets"
  type        = string
  default     = "ll-secret-admin-password"
}

#############################################################################
# Network Resources
#############################################################################

variable vnet_name {
  description = "Virtual Network name"
  type        = string
  default     = "cc-ll-vnet-eus2-01"
}

variable "vnet_address_space" {
  description = "CIDR address block for the vnet"
  type        = string
  default     = "11.1.3.0/24"
}

variable "subnet_count" {
  description = "Number of logical sub networks (subnet) to divide the VNET into"
  type        = number
  default     = 4
}

variable "subnet_prefixes" {
  description = "CIDR ranges for subnets"
  type        = list
  default     = ["11.1.3.0/26", "11.1.3.64/26", "11.1.3.128/26", "11.1.3.192/26"]
}

variable "subnet_names" {
  description = "Logical names of the subnets"
  type        = list
  default     = ["cc-ll-snet-01-vnet-eus2-01", "cc-ll-snet-02-vnet-eus2-01", "cc-ll-snet-03-vnet-eus2-01", "cc-ll-snet-04-vnet-eus2-01"]
}

variable "network_security_group_name_00" {
  description = "Network Security Group (nsg) names"
  type        = string
  default     = "cc-ll-nsg-00"
}

#############################################################################
# Compute/VM Resources
#############################################################################

variable "virtual_machine_name" {
  description = "Virtual machine name"
  type        = string
  default     = "cc-ll-vm"
}

variable "virtual_machine_private_ip_addresses" {
  description = "Private addresses for the virtual machines"
  type        = list
  default     = ["11.1.3.70", "11.1.3.71"]
}

variable "web_linux_vm_size" {
  description = "Size (SKU) of the virtual machine to create"
  type        = string
  default     = "Standard_B1ms"
}

variable "web_linux_admin_username" {
  description = "Admin password for the virtual machine"
  type        = string
  default     = "ll-admin"
}

variable "web_linux_vm_count" {
  description = "The number of web server linux virtual machines to create"
  type        = number
  default     = 1
}

variable "web_linux_vm_az_zone" {
  description = "The the availability zone for the virtual machine"
  type        = number
  default     = 1
}

variable "web_linux_license_type" {
  description = "Specifies the BYOL type for the virtual machine."
  type        = string
  default     = null
}

variable "web_linux_delete_os_disk_suffix" {
  description = "Default suffix for OS disk name"
  type        = string
  default     = "-os"
}

variable "web_linux_delete_os_disk_on_termination" {
  description = "Should the OS Disk (either the Managed Disk / VHD Blob) be deleted when the Virtual Machine is destroyed?"
  type        = string
  default     = "true"
}

variable "web_linux_delete_data_disks_on_termination" {
  description = "Should the Data Disks (either the Managed Disks / VHD Blobs) be deleted when the Virtual Machine is destroyed?"
  type        = string
  default     = "true"
}

variable "web_linux_vm_image" {
  type        = map(string)
  description = "Virtual machine source image information"
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

variable "public_ip_suffix" {
  description = "default suffix for public ip addresses"
  type        = string
  default     = "-pip"
}

variable "network_interface_card_suffix" {
  description = "default suffix for network interface cards"
  type        = string
  default     = "-nic"
}

variable "network_interface_ip_config_suffix" {
  description = "default suffix for network interface card ip configurations"
  type        = string
  default     = "-ip-conf"
}

variable "public_ip_allocation_method" {
  description = "default allocation method for public ip addresses"
  type        = string
  default     = "Static"
}

variable "private_ip_allocation_method" {
  description = "default allocation method for public ip addresses"
  type        = string
  default     = "Static"
}

variable "private_ip_allocaiton_method" {
  description = "default allocation method for private ip addresses"
  type        = string
  default     = "static"
}

