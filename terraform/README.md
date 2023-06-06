This terraform project will deploy a Nexus repository acting as a private registry

az login --use-device-code --scope https://graph.microsoft.com/.default
terraform plan -out main.tfplan
