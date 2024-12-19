########################################################################################################################
# Outputs
########################################################################################################################

output "account_id" {
  description = "Account ID of the existing watson Discovery instance"
  value       = module.watson_discovery.account_id
}

output "id" {
  description = "ID of the watson Discovery instance."
  value       = module.watson_discovery.id
}

output "crn" {
  description = "CRN of the existing watson Discovery instance"
  value       = module.watson_discovery.crn
}

output "name" {
  description = "Name of the existing Watson Discovery instance"
  value       = module.watson_discovery.name
}

output "guid" {
  description = "GUID of the existing Watson Discovery instance"
  value       = module.watson_discovery.guid
}

output "plan_id" {
  description = "Plan ID of the existing Watson Discovery instance."
  value       = module.watson_discovery.plan_id
}

output "dashboard_url" {
  description = "Dashboard URL of the existing Watson Discovery instance."
  value       = module.watson_discovery.dashboard_url
}
