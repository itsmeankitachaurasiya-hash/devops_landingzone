res_gp = {
  rg1 = {
    name     = "dev-rg"
    location = "central india" 
  }
}
vert_net = {
  v_net1 = {
    name                = "dev-vnet"
    resource_group_name = "dev-rg"
    location            = "central india" 
    address_space       = ["11.0.0.0/16"]
  }
}
sub_net = {
  s_net1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["11.0.1.0/24"]
  }
  s_net2 = {
    name                 = "backend-subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["11.0.2.0/24"]
  }
}
bastion = {
  bastion1 = {
    subnet_name          = "AzureBastionSubnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["11.0.3.0/26"]
    pip_name             = "bastionpip"
    location             = "central india" 
    allocation_method    = "Static"
    bastion_host_name    = "bastionhost"
  }
}
vms = {
  vm1 = {
    nic_name             = "frontend-nic"
    location             = "central india" 
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    subnet_name          = "frontend-subnet"
    #     public_ip_name      = "frontend_pip"
    vm_name         = "frontend-vm"
    size            = "Standard_D2s_v4" 
    admin_username  = "devops"
    admin_password  = "devops@123456"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"

  }
  vm2 = {
    nic_name             = "backend-nic"
    location             = "central india" 
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"
    subnet_name          = "backend-subnet"
    #     public_ip_name      = "backend_pip"
    vm_name         = "backend-vm"
    size            = "Standard_D2s_v4" 
    admin_username  = "devops"
    admin_password  = "devops@123456"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
}