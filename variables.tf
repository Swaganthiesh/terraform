variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to deploy the resources"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "route_table_name" {
  description = "Name of the Route Table"
  type        = string
}

variable "address_space" {
  description = "Address space for VNet"
  type        = list(string)
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = list(string)
}

variable "nsg_rule_name" {
  description = "NSG rule name"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}
