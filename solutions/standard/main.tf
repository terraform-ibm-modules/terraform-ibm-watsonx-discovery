#######################################################################################################################
# Resource Group
#######################################################################################################################

module "resource_group" {
  source                       = "terraform-ibm-modules/resource-group/ibm"
  version                      = "1.1.6"
  resource_group_name          = var.use_existing_resource_group == false ? (var.prefix != null ? "${var.prefix}-${var.resource_group_name}" : var.resource_group_name) : null
  existing_resource_group_name = var.use_existing_resource_group == true ? var.resource_group_name : null
}

#######################################################################################################################
# Watson Discovery
#######################################################################################################################

module "watson_discovery" {
  source                = "../../"
  region                = var.region
  plan                  = var.plan
  resource_group_id     = module.resource_group.resource_group_id
  watson_discovery_name = var.prefix != null ? "${var.prefix}-${var.name}" : var.name
  service_endpoints     = var.service_endpoints
  access_tags           = var.access_tags
  resource_tags         = var.resource_tags
}
