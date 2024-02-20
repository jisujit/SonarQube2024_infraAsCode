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
//TODO: Confirm the need for "features"
provider "azurerm" {
  # Configuration options
  features {}
}

//TODO: Virtual Network
//TODO: SonarQube Subnet
//TODO: VM
//TODO: NIC with IP address? Difference if internal vs external?
//TODO: VM for installing MS SQL Server
