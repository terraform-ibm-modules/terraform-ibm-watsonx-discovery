########################################################################################################################
# Access Tags
########################################################################################################################

resource "ibm_resource_tag" "watson_discovery_tag" {
  count       = length(var.access_tags) == 0 ? 0 : 1
  resource_id = var.existing_watson_discovery_instance_crn != null ? var.existing_watson_discovery_instance_crn : ibm_resource_instance.watson_discovery_instance[0].crn
  tags        = var.access_tags
  tag_type    = "access"
}

########################################################################################################################
# watson Discovery
########################################################################################################################
locals {
  watson_discovery_crn           = var.existing_watson_discovery_instance_crn != null ? data.ibm_resource_instance.existing_discovery_instance[0].crn : ibm_resource_instance.discovery_instance[0].crn
  watson_discovery_guid          = var.existing_watson_discovery_instance_crn != null ? data.ibm_resource_instance.existing_discovery_instance[0].guid : ibm_resource_instance.discovery_instance[0].guid
  watson_discovery_name          = var.existing_watson_discovery_instance_crn != null ? data.ibm_resource_instance.existing_discovery_instance[0].resource_name : ibm_resource_instance.discovery_instance[0].resource_name
  watson_discovery_plan_id       = var.existing_watson_discovery_instance_crn != null ? null : ibm_resource_instance.discovery_instance[0].resource_plan_id
  watson_discovery_dashboard_url = var.existing_watson_discovery_instance_crn != null ? null : ibm_resource_instance.discovery_instance[0].dashboard_url
}

data "ibm_resource_instance" "existing_watson_discovery_instance" {
  count      = var.existing_watson_discovery_instance_crn != null ? 1 : 0
  identifier = var.existing_watson_discovery_instance_crn
}

resource "ibm_resource_instance" "watson_discovery_instance" {
  count             = var.existing_watson_discovery_instance_crn != null ? 0 : 1
  name              = "${var.resource_prefix}-watson-discovery-instance"
  service           = "discovery"
  plan              = var.watson_discovery_plan
  location          = var.location
  resource_group_id = module.resource_group.resource_group_id

  parameters = {
    service-endpoints = var.watson_discovery_service_endpoints
  }

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
