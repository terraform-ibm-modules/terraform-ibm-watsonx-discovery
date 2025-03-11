#######################################################################################################################
# Local block
#######################################################################################################################

locals {
  prefix = var.prefix != null ? trimspace(var.prefix) != "" ? "${var.prefix}-" : "" : ""
}

#######################################################################################################################
# Resource Group
#######################################################################################################################

module "resource_group" {
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  existing_resource_group_name = var.existing_resource_group_name
}

#######################################################################################################################
# Watson Discovery
#######################################################################################################################

module "watson_discovery" {
  source                = "../../"
  region                = var.region
  plan                  = var.service_plan
  resource_group_id     = module.resource_group.resource_group_id
  watson_discovery_name = var.watsonx_discovery_instance_name != null ? "${local.prefix}${var.watsonx_discovery_instance_name}" : null
  service_endpoints     = var.service_endpoints
  access_tags           = var.access_tags
  resource_tags         = var.resource_tags
}
