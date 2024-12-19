########################################################################################################################
# Outputs
########################################################################################################################

output "crn" {
  description = "CRN of the existing Watson Discovery instance."
  value       = module.existing_watson_discovery_instance.crn
}

output "account_id" {
  description = "Account ID of the existing Watson Discovery instance"
  value       = module.existing_watson_discovery_instance.account_id
}

output "id" {
  description = "ID of the Watson Discovery instance."
  value       = module.existing_watson_discovery_instance.id
}

output "name" {
  description = "Name of the existing Watson Discovery instance"
  value       = module.existing_watson_discovery_instance.name
}

output "guid" {
  description = "GUID of the existing Watson Discovery instance"
  value       = module.existing_watson_discovery_instance.guid
}

output "plan_id" {
  description = "Plan ID of the existing Watson Discovery instance."
  value       = module.existing_watson_discovery_instance.plan_id
}

output "dashboard_url" {
  description = "Dashboard URL of the existing Watson Discovery instance."
  value       = module.existing_watson_discovery_instance.dashboard_url
}
