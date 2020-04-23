## Providers

| Name | Version |
|------|---------|
| azuread | n/a |
| azurerm | ~> 1.44.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| current\_azuread\_user\_upn | the user prinnipal name for associated with you subscription | `string` | n/a | yes |
| key\_vault\_admin\_secret\_password\_name | Management Key Vault for secrets | `string` | `"ll-secret-admin-password"` | no |
| key\_vault\_name | Management Key Vault for secrets | `string` | `"cc-ll-kv"` | no |
| location | The Azure Region where we will perform deployments | `string` | `"eastus2"` | no |
| network\_interface\_card\_suffix | default suffix for network interface cards | `string` | `"-nic"` | no |
| network\_interface\_ip\_config\_suffix | default suffix for network interface card ip configurations | `string` | `"-ip-conf"` | no |
| network\_security\_group\_name\_00 | Network Security Group (nsg) names | `string` | `"cc-ll-nsg-00"` | no |
| private\_ip\_allocaiton\_method | default allocation method for private ip addresses | `string` | `"static"` | no |
| private\_ip\_allocation\_method | default allocation method for public ip addresses | `string` | `"Static"` | no |
| public\_ip\_allocation\_method | default allocation method for public ip addresses | `string` | `"Static"` | no |
| public\_ip\_suffix | default suffix for public ip addresses | `string` | `"-pip"` | no |
| resource\_group\_name | The primary resource group for infrastructure deployment. | `string` | `"cc-ll-rg"` | no |
| subnet\_count | Number of logical sub networks (subnet) to divide the VNET into | `number` | `4` | no |
| subnet\_names | Logical names of the subnets | `list` | <pre>[<br>  "cc-ll-snet-01-vnet-eus2-01",<br>  "cc-ll-snet-02-vnet-eus2-01",<br>  "cc-ll-snet-03-vnet-eus2-01",<br>  "cc-ll-snet-04-vnet-eus2-01"<br>]</pre> | no |
| subnet\_prefixes | CIDR ranges for subnets | `list` | <pre>[<br>  "11.1.3.0/26",<br>  "11.1.3.64/26",<br>  "11.1.3.128/26",<br>  "11.1.3.192/26"<br>]</pre> | no |
| subscription\_id | The subscription id for the resource that you will proivision. | `string` | n/a | yes |
| tags | Standard tags that will get applied to resources. | `map` | <pre>{<br>  "ApplicationName": "Lunch and Learn",<br>  "BudgetAmount": "0.00",<br>  "Compliance": "None",<br>  "DisasterRecovery": "None",<br>  "Environment": "Test",<br>  "InitiativeName": "Training",<br>  "POC": "Jim Smith",<br>  "Region": "eastus2",<br>  "StartSchedule": "0 7 * * 1_5",<br>  "StopSchedule": "0 19 * * 1_5"<br>}</pre> | no |
| tenant\_id | The tenant id for your Azure Account. | `string` | n/a | yes |
| virtual\_machine\_name | Virtual machine name | `string` | `"cc-ll-vm"` | no |
| virtual\_machine\_private\_ip\_addresses | Private addresses for the virtual machines | `list` | <pre>[<br>  "11.1.3.70",<br>  "11.1.3.71"<br>]</pre> | no |
| vnet\_address\_space | CIDR address block for the vnet | `string` | `"11.1.3.0/24"` | no |
| vnet\_name | Virtual Network name | `string` | `"cc-ll-vnet-eus2-01"` | no |
| web\_linux\_admin\_username | Admin password for the virtual machine | `string` | `"ll-admin"` | no |
| web\_linux\_delete\_data\_disks\_on\_termination | Should the Data Disks (either the Managed Disks / VHD Blobs) be deleted when the Virtual Machine is destroyed? | `string` | `"true"` | no |
| web\_linux\_delete\_os\_disk\_on\_termination | Should the OS Disk (either the Managed Disk / VHD Blob) be deleted when the Virtual Machine is destroyed? | `string` | `"true"` | no |
| web\_linux\_delete\_os\_disk\_suffix | Default suffix for OS disk name | `string` | `"-os"` | no |
| web\_linux\_license\_type | Specifies the BYOL type for the virtual machine. | `string` | n/a | yes |
| web\_linux\_vm\_az\_zone | The the availability zone for the virtual machine | `number` | `1` | no |
| web\_linux\_vm\_count | The number of web server linux virtual machines to create | `number` | `1` | no |
| web\_linux\_vm\_image | Virtual machine source image information | `map(string)` | <pre>{<br>  "offer": "UbuntuServer",<br>  "publisher": "Canonical",<br>  "sku": "18.04-LTS",<br>  "version": "latest"<br>}</pre> | no |
| web\_linux\_vm\_size | Size (SKU) of the virtual machine to create | `string` | `"Standard_B1ms"` | no |

## Outputs

| Name | Description |
|------|-------------|
| web\_linux\_dns\_name | Public IP DNS Label |
| web\_linux\_vm\_admin\_password | Administrator password for the Virtual Machine |
| web\_linux\_vm\_ip\_address | {Public IP Address |
