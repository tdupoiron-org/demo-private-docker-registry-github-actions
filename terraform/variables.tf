variable "resource_prefix" {
  type        = string
  default     = "tdupoiron"
}

variable "resource_owner" {
  type        = string
  default     = "tdupoiron"
}

variable "resource_group_location" {
  type        = string
  default     = "francecentral"
}

variable "azurerm_kubernetes_cluster_dns_prefix" {
  type        = string
  default     = "tdupoiron-dns"
}

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 3
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}