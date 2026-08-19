
module "resource_group" {
  source = "../../child_modules/azurerm_resource_group"
  rg     = var.res_gp
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../child_modules/azurerm_virtual_network"
  v_net      = var.vert_net
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../child_modules/azurerm_subnet"
  s_net      = var.sub_net
}

module "bastion" {
  depends_on = [module.virtual_network]
  source     = "../../child_modules/azurerm_bastion"
  bastion    = var.bastion
}
module "virtual_machine" {
  depends_on = [module.subnet]
  source     = "../../child_modules/azurerm_virtual_machine"
  vms        = var.vms
}