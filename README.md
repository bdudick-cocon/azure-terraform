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

cd azure-terraform

ls -la

```
## Add Your Account Specific Info To the terraform.tfvars file and init terraform

```
code terraform.tfvars

terraform init

```

## Create The Resource Group

```
code main.tf

terraform plan

terraform apply
```

## Destroy The Resource Group

```
terraform destroy
```

## Create The Resource Group And Key Vault

```
mv 01_key_vault.txt 01_key_vault.tf

code 01_key_vault.tf

terraform plan

terraform apply
```

## Create The Network

```
mv 02_network_main.txt 02_network_main.tf

code 02_network_main.tf

terraform plan

terraform apply
```

## Create The Network Security Group

```
mv 03_network_security.txt 03_network_security.tf

code 03_network_security.tf

terraform plan

terraform apply
```

## Create The Linux Web VM

```
mv 04_linux_vm_main.txt 04_linux_vm_main.tf

code 04_linux_vm_main.tf

terraform plan

terraform apply
```

## Clean Things Up

```
terraform destroy
```