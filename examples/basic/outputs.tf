########################################################################################################################
# Outputs
########################################################################################################################

output "crn" {
  description = "CRN of the watson Discovery instance"
  value       = module.watson_discovery.crn
}

output "guid" {
  description = "GUID of the watson Discovery instance"
  value       = module.watson_discovery.guid
}

output "name" {
  description = "Name of the watson Discovery instance"
  value       = module.watson_discovery.name
}

output "resource_group_id" {
  description = "The resource group ID to provision the watson Discovery instance."
  value       = module.resource_group.resource_group_id
}

output "resource_group_name" {
  description = "The resource group name to provision the watson Discovery instance."
  value       = module.resource_group.resource_group_name
}
