########################################################################################################################
# Outputs
########################################################################################################################

output "name" {
  description = "The name of the Watson Discovery instance"
  value       = module.existing_watson_discovery_instance.watson_discovery_name
}

output "guid" {
  description = "GUID of the Watson Discovery instance"
  value       = module.existing_watson_discovery_instance.watson_discovery_guid
}
