########################################################################################################################
# Watson Discovery
########################################################################################################################

module "existing_watson_discovery_instance" {
  source                                 = "../../"
  access_tags                            = var.access_tags
  existing_watson_discovery_instance_crn = var.existing_watson_discovery_instance_crn
}
