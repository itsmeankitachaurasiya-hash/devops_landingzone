variable "s_net" {}
resource "azurerm_subnet" "subnet" {
  for_each = var.s_net
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes 
}
