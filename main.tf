
########################################################################################################################
# watson Discovery
########################################################################################################################
locals {
  account_id               = var.existing_watson_discovery_instance_crn != null ? module.crn_parser[0].account_id : ibm_resource_instance.watson_discovery_instance[0].account_id
  watson_discovery_id      = var.existing_watson_discovery_instance_crn != null ? data.ibm_resource_instance.existing_watson_discovery_instance[0].id : ibm_resource_instance.watson_discovery_instance[0].id
  watson_discovery_crn     = var.existing_watson_discovery_instance_crn != null ? var.existing_watson_discovery_instance_crn : ibm_resource_instance.watson_discovery_instance[0].crn
  watson_discovery_guid    = var.existing_watson_discovery_instance_crn != null ? data.ibm_resource_instance.existing_watson_discovery_instance[0].guid : ibm_resource_instance.watson_discovery_instance[0].guid
  watson_discovery_name    = var.existing_watson_discovery_instance_crn != null ? data.ibm_resource_instance.existing_watson_discovery_instance[0].resource_name : ibm_resource_instance.watson_discovery_instance[0].resource_name
  watson_discovery_plan_id = var.existing_watson_discovery_instance_crn != null ? null : ibm_resource_instance.watson_discovery_instance[0].resource_plan_id
  # Below is the temporary workaround to get the dashboard_url and should be removed later. Refer [Issue-12944](https://github.ibm.com/GoldenEye/issues/issues/12944)
  watson_discovery_dashboard_url = "https://cloud.ibm.com/services/discovery/${urlencode(local.watson_discovery_crn)}"
}

module "crn_parser" {
  count   = var.existing_watson_discovery_instance_crn != null ? 1 : 0
  source  = "terraform-ibm-modules/common-utilities/ibm//modules/crn-parser"
  version = "1.1.0"
  crn     = var.existing_watson_discovery_instance_crn
}

data "ibm_resource_instance" "existing_watson_discovery_instance" {
  count      = var.existing_watson_discovery_instance_crn != null ? 1 : 0
  identifier = var.existing_watson_discovery_instance_crn
}

resource "ibm_resource_instance" "watson_discovery_instance" {
  count             = var.existing_watson_discovery_instance_crn != null ? 0 : 1
  resource_group_id = var.resource_group_id
  name              = var.watson_discovery_name
  location          = var.region
  service           = "discovery"
  plan              = var.plan
  tags              = var.resource_tags
  parameters = {
    service-endpoints = var.service_endpoints
  }

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

########################################################################################################################
# Attach Access Tags
########################################################################################################################

resource "ibm_resource_tag" "watson_discovery_tag" {
  count       = length(var.access_tags) == 0 ? 0 : 1
  resource_id = var.existing_watson_discovery_instance_crn != null ? var.existing_watson_discovery_instance_crn : ibm_resource_instance.watson_discovery_instance[0].crn
  tags        = var.access_tags
  tag_type    = "access"
}
