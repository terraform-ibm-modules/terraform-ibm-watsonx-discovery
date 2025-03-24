##############################################################################
# Input Variables
##############################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API key to deploy resources."
  sensitive   = true
}

variable "provider_visibility" {
  description = "Set the visibility value for the IBM terraform provider. Supported values are `public`, `private`, `public-and-private`. [Learn more](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/guides/custom-service-endpoints)."
  type        = string
  default     = "private"

  validation {
    condition     = contains(["public", "private", "public-and-private"], var.provider_visibility)
    error_message = "Invalid visibility option. Allowed values are 'public', 'private', or 'public-and-private'."
  }
}

variable "existing_resource_group_name" {
  type        = string
  description = "The name of an existing resource group to provision the Watson.discovery in."
  default     = "Default"
}

variable "prefix" {
  type        = string
  nullable    = true
  description = "The prefix to add to all resources that this solution creates (e.g `prod`, `test`, `dev`). To not use any prefix value, you can set this value to `null` or an empty string.`"
}

variable "watson_discovery_instance_name" {
  type        = string
  description = "The name of the Watson Discovery instance. If a prefix input variable is specified, the prefix is added to the name in the `<prefix>-<name>` format."
  default     = "discovery"
}

variable "region" {
  description = "The region where you want to deploy your instance."
  type        = string
  default     = "us-south"
}

variable "service_plan" {
  type        = string
  description = "The plan that is required to provision the Watson Discovery instance. Possible values are: plus, enterprise. [Learn more](https://cloud.ibm.com/docs/discovery-data?topic=discovery-data-pricing-plans)."
  default     = "enterprise"
}

variable "resource_tags" {
  type        = list(string)
  description = "Optional list of tags to describe the newly created Watson Discovery instance."
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the Watson Discovery instance. [Learn more](https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial)."
  default     = []
}

variable "service_endpoints" {
  description = "Types of the service endpoints that can be applied to a Watson Discovery instance. Possible values are : public, private or public-and-private."
  type        = string
  default     = "private"
}
