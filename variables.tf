########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The resource group ID for the Watson Discovery instance. Required to create an instance of Watson Discovery."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watson_discovery_instance_crn == null ? length(var.resource_group_id) > 0 : true
    error_message = "You must specify a value for 'resource_group_id' if 'existing_watson_discovery_instance_crn' is set to `null`."
  }
}

variable "region" {
  description = "The region for the Watson Discovery instance. Required to create an instance of Watson Discovery."
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
    error_message = "The `region` must be specified and set to one of the following possible values: 'eu-de', 'eu-gb', 'jp-tok', 'us-south', 'au-syd', 'us-east'."
  }
}

variable "resource_tags" {
  description = "Optional list of tags to describe the Watson Discovery instance."
  type        = list(string)
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the Watson Discovery instance. [Learn more](https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial)."
  default     = []

  validation {
    condition = alltrue([
      for tag in var.access_tags : can(regex("[\\w\\-_\\.]+:[\\w\\-_\\.]+", tag)) && length(tag) <= 128
    ])
    error_message = "Tags must match the regular expression `\"[\\w\\-_\\.]+:[\\w\\-_\\.]+\"`. [Learn more](https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#limits)."
  }
}

variable "existing_watson_discovery_instance_crn" {
  description = "The CRN of an existing Watson Discovery instance. If not provided, a new instance is created."
  type        = string
  default     = null
}

variable "watson_discovery_name" {
  description = "The name of the Watson Discovery instance. Required to create a new instance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watson_discovery_instance_crn == null ? length(var.watson_discovery_name) > 0 : true
    error_message = "Provide a name for the Watson Discovery instance to create it."
  }
}

variable "plan" {
  description = "The Watson Discovery plan to create an instance of Watson Discovery. Possible values are `plus`, `enterprise` or `premium`."
  type        = string
  default     = "plus"

  validation {
    condition     = var.existing_watson_discovery_instance_crn != null || var.plan != null
    error_message = "The plan must be provided to create the Watson Discovery instance. Possible values are `plus` , `enterprise` or `premium`."
  }
  validation {
    condition = anytrue([
      var.plan == "plus",
      var.plan == "enterprise",
      var.plan == "premium"
    ]) || var.existing_watson_discovery_instance_crn != null
    error_message = "A new Watson Discovery instance requires a 'plus', 'enterprise' or 'premium' plan. [Learn more](https://cloud.ibm.com/docs/discovery-data?topic=discovery-data-pricing-plans)."
  }
}

variable "service_endpoints" {
  description = "Types of the service endpoints that can be set to a Watson Discovery instance. Possible values are 'public', 'private', or 'public-and-private'."
  type        = string
  default     = "public-and-private"
  validation {
    condition     = contains(["public", "public-and-private", "private"], var.service_endpoints)
    error_message = "The specified service endpoint is not valid. Possible values are 'public', 'private', 'public-and-private'."
  }
}
