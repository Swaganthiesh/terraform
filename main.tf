resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.address_space
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address_prefix
}

resource "azurerm_network_security_group" "example" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_network_security_rule" "example" {
  name                        = var.nsg_rule_name
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.example.name
  resource_group_name        = azurerm_resource_group.example.name
}

resource "azurerm_route_table" "example" {
  name                = var.route_table_name
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
}

# Define routes in the route table
resource "azurerm_route" "example" {
  name                   = "route-to-internet"
  resource_group_name    = azurerm_resource_group.example.name
  route_table_name       = azurerm_route_table.example.name
  address_prefix         = "0.0.0.0/0"          # Route to all traffic (Internet)
  next_hop_type          = "Internet"            # Direct traffic to the Internet
}

resource "azurerm_subnet_route_table_association" "example" {
  subnet_id      = azurerm_subnet.example.id
  route_table_id = azurerm_route_table.example.id
}

# Associate Network Security Group (NSG) to the subnet
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}
