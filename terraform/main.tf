# Resource Group
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = "${var.resource_prefix}-rg"
  tags = { "owner" = var.resource_owner }
}

# Service App
resource "azurerm_service_plan" "sp" {
 name                = "${var.resource_prefix}-service-plan"
 location            = var.resource_group_location
 resource_group_name = azurerm_resource_group.rg.name
 os_type             = "Linux"
 sku_name            = "P1v2"
}

# Service Container
resource "azurerm_linux_web_app" "example" {
  name                = "${var.resource_prefix}-nexus-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.sp.location
  service_plan_id     = azurerm_service_plan.sp.id

  site_config {
    application_stack {
      docker_image = "sonatype/nexus3"
      docker_image_tag = "latest"
    }
  }
}

# Kubernetes Cluster
# resource "azurerm_kubernetes_cluster" "k8s" {
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   name                = "${var.resource_prefix}-cluster"
#   dns_prefix          = var.azurerm_kubernetes_cluster_dns_prefix

#   identity {
#     type = "SystemAssigned"
#   }

#   default_node_pool {
#     name       = "agentpool"
#     vm_size    = "Standard_D2_v2"
#     node_count = var.node_count
#   }
#   linux_profile {
#     admin_username = "ubuntu"

#     ssh_key {
#       key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
#     }
#   }
#   network_profile {
#     network_plugin    = "kubenet"
#     load_balancer_sku = "standard"
#   }
# }