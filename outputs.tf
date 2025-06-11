output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.example.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.example.id
}

output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.example.id
}

output "route_table_id" {
  description = "The ID of the Route Table"
  value       = azurerm_route_table.example.id
}
