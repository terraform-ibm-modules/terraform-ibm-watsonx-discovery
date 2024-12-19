##############################################################################
# Input Variables
##############################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API key to deploy resources."
  sensitive   = true
}

variable "use_existing_resource_group" {
  type        = bool
  description = "Whether to use an existing resource group."
  default     = false
}

variable "resource_group_name" {
  type        = string
  description = "The name of a new or an existing resource group to provision the Watson Discovery in. If a prefix input variable is specified, the prefix is added to the name in the `<prefix>-<name>` format."
}

variable "prefix" {
  type        = string
  description = "Prefix to add to all resources created by this solution."
  default     = null
}

variable "name" {
  type        = string
  description = "The name of the Watson Discovery instance. If a prefix input variable is specified, the prefix is added to the name in the `<prefix>-<name>` format."
  default     = "discovery"
}

variable "region" {
  description = "The region where you want to deploy your instance."
  type        = string
  default     = "us-south"
}

variable "plan" {
  type        = string
  description = "The plan that is required to provision the Watson Discovery instance. Possible values are: plus, enterprise, premium. [Learn more](https://cloud.ibm.com/docs/discovery-data?topic=discovery-data-pricing-plans)."
  default     = "plus"
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
  default     = "public-and-private"
}
