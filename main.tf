/*
 * File Name: main.tf
 * Author: Sujit Gangadharan (your.email@example.com)
 * Date Created: 2024-02-19
 * Last Modified: 2024-02-19
 * Description:
 *   This Terraform configuration sets up an Azure VM in a Spoke virtual network to install SonarQube 
 */

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.92.0"
    }
  }
}
// TODO: Confirm the need for "features"
provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

//TODO: Virtual Network
//https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
// SG: Added here
// TODO: SonarQube Subnet
// TODO: VM
// TODO: NIC with IP address? Difference if internal vs external?
// TODO: VM for installing MS SQL Server

resource "azurerm_resource_group" "SonarQube_rg" {
  name     = "sonarqube-resources"
  location = "US-East2" //SG: How can I know the list of possible values here?
}

//SG: what is this SG going to be used for? How can I give a useful name for the nsg_group-type and name?
resource "azurerm_network_security_group" "SonarQube_nsg" {
  name                = "sonarqube-security-group"
  location            = azurerm_resource_group.SonarQube_rg.location
  resource_group_name = azurerm_resource_group.SonarQube_rg.name
}

resource "azurerm_virtual_network" "SharedVNET" {
  name                = "shared-network"
  location            = azurerm_resource_group.SonarQube_rg.location
  resource_group_name = azurerm_resource_group.SonarQube_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}
