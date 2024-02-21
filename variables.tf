variable "subscription_id" {
  description = "The Subscription ID used for the Azure resources."
  type        = string
}

variable "client_id" {
  description = "The Client ID of the Azure Service Principal."
  type        = string
}

variable "client_secret" {
  description = "The Client Secret of the Azure Service Principal."
  type        = string
}

variable "tenant_id" {
  description = "The Tenant ID of the Azure Service Principal."
  type        = string
}
