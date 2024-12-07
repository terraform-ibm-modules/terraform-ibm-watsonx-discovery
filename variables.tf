########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The resource group ID where the watson Discovery instance will be grouped. Required when creating a new instance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watson_discovery_instance_crn == null ? length(var.resource_group_id) > 0 : true
    error_message = "You must specify a value for \"resource_group_id\" if \"existing_watson_discovery_instance_crn\" is null."
  }
}

variable "region" {
  description = "Region where watson Discovery instance will be provisioned. Required if creating a new instance. If using an existing instance, this can be null."
  type        = string
  default     = "us-south"

  validation {
    condition = var.existing_watson_discovery_instance_crn != null || anytrue([
      var.region == "au-syd",
      var.region == "eu-de",
      var.region == "eu-gb",
      var.region == "jp-tok",
      var.region == "us-east",
      var.region == "us-south",
    ])
    error_message = "Region must be specified and set to one of the permitted values (\"eu-de\", \"eu-gb\", \"jp-tok\", \"us-south\", \"au-syd\", \"us-east\") when provisioning a new instance."
  }
}

variable "resource_tags" {
  description = "Optional list of tags to describe the watson Discovery instance."
  type        = list(string)
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the watson Discovery instance created by the module. For more information, see https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial."
  default     = []

  validation {
    condition = alltrue([
      for tag in var.access_tags : can(regex("[\\w\\-_\\.]+:[\\w\\-_\\.]+", tag)) && length(tag) <= 128
    ])
    error_message = "Tags must match the regular expression \"[\\w\\-_\\.]+:[\\w\\-_\\.]+\", see https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#limits for more details"
  }
}

variable "existing_watson_discovery_instance_crn" {
  description = "The CRN of an existing watson Discovery instance."
  type        = string
  default     = null
}

variable "watson_discovery_name" {
  description = "The name of the watson Discovery instance. Required if creating a new instance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watson_discovery_instance_crn == null ? length(var.watson_discovery_name) > 0 : true
    error_message = "watson Discovery name must be provided when creating a new instance."
  }
}

variable "plan" {
  description = "The plan that is required to provision the watson Discovery instance."
  type        = string
  default     = "plus"

  validation {
    condition     = var.existing_watson_discovery_instance_crn != null || var.plan != null
    error_message = "watson Discovery plan must be provided when creating a new instance."
  }
  validation {
    condition = anytrue([
      var.plan == "plus",
      var.plan == "enterprise",
      var.plan == "premium",
    ]) || var.existing_watson_discovery_instance_crn != null
    error_message = "A new watson Discovery instance requires a \"plus\", \"enterprise\", or \"premium\" plan. [Learn more](https://cloud.ibm.com/docs/discovery-data?topic=discovery-data-pricing-plans)."
  }
}

variable "service_endpoints" {
  description = "Types of the service endpoints that can be set to a Watson Discovery instance. Possible values are : 'public', 'private' or 'public-and-private'."
  type        = string
  default     = "public-and-private"
  validation {
    condition     = contains(["public", "public-and-private", "private"], var.service_endpoints)
    error_message = "The specified service endpoint is not valid. Supported options are \"public\", \"private\", \"public-and-private\"."
  }
}
