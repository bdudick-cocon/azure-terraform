# Introduction 
The files contained in this repository are for a Lunch and Learn session covering Azure and Hashi Corp Terraform. We will walk through a basic Terraform configuration that involves creating the following infrastructure resources:

- [Resource Group](https://www.terraform.io/docs/providers/azurerm/r/resource_group.html)
- [Virtual Network and Subnets](https://www.terraform.io/docs/providers/azurerm/r/virtual_network.html)
- [Network Security Groups](https://www.terraform.io/docs/providers/azurerm/r/network_security_group.html)
- [Virtual Machine](https://www.terraform.io/docs/providers/azurerm/r/windows_virtual_machine.html)
- [Key Vault and Key Vault Secret](https://www.terraform.io/docs/providers/azurerm/r/key_vault.html)

# Useful references:
- [Hashi Corp Terraform](https://www.hashicorp.com/products/terraform)
- [Terraform Azure Provider](https://www.terraform.io/docs/providers/azurerm/index.html)
- [Azure Cloud Shell](https://azure.microsoft.com/en-us/features/cloud-shell/)

# Steps:

## Get Setup In Cloud Shell With The Correct Subscription

```
az account show

az account list

az account set -s <subscription_id>

az account show
```

## Clone The Repo and Look at the files

```
git clone https://github.com/bdudick-cocon/azure-terraform.git

ls -la

cd azure-terraform-ll

la -la

```

## Create The Resource Group

```
code main.tf

terraform init

terraform plan

terraform apply
```