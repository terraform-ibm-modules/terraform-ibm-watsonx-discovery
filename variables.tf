########################################################################################################################
# Input Variables
########################################################################################################################

variable "region" {
  description = "IBM Cloud region where the watson Discovery instance will be created. Required if creating a new instance. If using an existing instance, this can be null."
  type        = string
  default     = null

  validation {
    condition = var.existing_watson_discovery_instance_crn != null || (var.region != null && anytrue([
      var.region == "eu-de",
      var.region == "us-south",
      var.region == "eu-gb",
      var.region == "jp-tok",
    ]))
    error_message = "IBM Cloud Region must be provided and set to one of the allowed values ('eu-de', 'eu-gb', 'jp-tok', 'us-south') when creating a new instance."
  }
}

variable "resource_tags" {
  description = "Metadata labels describing this watson discovery instance."
  type        = list(string)
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the watson discovery instance created by the module. For more information, see https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial."
  default     = []

  validation {
    condition = alltrue([
      for tag in var.access_tags : can(regex("[\\w\\-_\\.]+:[\\w\\-_\\.]+", tag)) && length(tag) <= 128
    ])
    error_message = "Tags must match the regular expression \"[\\w\\-_\\.]+:[\\w\\-_\\.]+\", see https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#limits for more details"
  }
}

# variable "resource_prefix" {
#   description = "The name to be used on all Watson resources as a prefix."
#   type        = string
#   default     = "watson-poc"

#   validation {
#     condition     = var.resource_prefix != "" && length(var.resource_prefix) <= 25
#     error_message = "You must provide a value for the resource_prefix variable and the resource_prefix length can't exceed 25 characters."
#   }
# }

variable "existing_watson_discovery_instance_crn" {
  description = "The CRN of an existing Watson Discovery instance."
  type        = string
  default     = null
}

variable "watson_discovery_plan" {
  description = "The plan that is required to provision the watson Discovery instance."
#   For `Trial` and `Lite` accounts, the `watson_assistant_service_endpoints` value is ignored and the default service configuration is applied."
#   The plan that's used to provision the Watson Discovery instance."
  type        = string
  default     = null

  validation {
    condition     = var.existing_watson_discovery_instance_crn != null || var.watson_assistant_plan != null
    error_message = "watson Discovery plan must be provided when creating a new instance."
  }
  validation {
    condition = anytrue([
      var.watson_discovery_plan == "plus",
      var.watson_discovery_plan == "enterprise",
      var.watson_discovery_plan == "premium",
    ])
    error_message = "You must use a plus, enterprise, or premium plan. [Learn more](https://cloud.ibm.com/docs/discovery-data?topic=discovery-data-pricing-plans)."
  }
}

variable "watson_discovery_service_endpoints" {
  description = "The type of service endpoints. Possible values: 'public', 'private', 'public-and-private'."
  type        = string
  default     = "public"
  validation {
    condition     = contains(["public", "public-and-private", "private"], var.watson_discovery_service_endpoints)
    error_message = "The specified service endpoint is not valid. Supported options are public, public-and-private, or private."
  }
}
