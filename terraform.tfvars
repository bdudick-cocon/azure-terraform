## https://adrianhall.github.io/typescript/2019/10/23/terraform-functions/

## https://www.terraform.io/docs/configuration/expressions.html

## https://www.terraform.io/docs/providers/azurerm/r/virtual_machine.html

## https://www.terraform.io/docs/providers/azurerm/r/public_ip.html

## https://learn.hashicorp.com/terraform/azurerm/authentication-service-principal-client-secret

## TODO: vms to zones, create lb
/*
Some preliminary work to do in Azure CLoud Shell to get Terraform
to talk to Azure Resource Manager and provision resource under our subscription.
If you have a single subscription run:

1) From Bash prompt run: az account show
2) From the output, copy <tenant id> and paste it in below for the tenant_id default 
3) From the output, copy <subscription id> and paste it in below for the subscription_id default 
4) From Bash prompt run: az ad user list
5) From the output, copy <userPrincipalName id> and paste it in below for the userPrincipalName default 

If you have more than one subscription run

1) From Bash prompt run: az account list
2) Check the output and find the subscription id/name where you want to provision resources. Copy the id value.
3) From Bash prompt run: az account set -s <subscription_id>
4) From Bash prompt run: az account show
5) Make sure the subscripion id/name output matches where you want to provision resources
6) From the output, copy <tenant id> and paste it in below for the tenant_id default 
7) From the output, copy <subscription id> and paste it in below for the subscription_id default 
8) From Bash prompt run: az ad user list
9) From the output, copy <userPrincipalName id> and paste it in below for the userPrincipalName default 

*/


/*
az account show
az account list
az account set -s <subscription_id>

*/

tenant_id                   = "<your_tenant_id>"
subscription_id             = "<your_subscription_id>"
current_azuread_user_upn    = "<your_azuread_user_upn>"