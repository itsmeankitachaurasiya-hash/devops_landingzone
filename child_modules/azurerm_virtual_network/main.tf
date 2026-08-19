variable "v_net"{}
resource "azurerm_virtual_network" "virtualnetwork"{
for_each = var.v_net
name = each.value.name
resource_group_name = each.value.resource_group_name
location = each.value.location
address_space = each.value.address_space
}