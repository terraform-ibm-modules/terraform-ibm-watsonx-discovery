##############################################################################
# Outputs
##############################################################################

output "account_id" {
  description = "Account ID of the Watson Discovery instance."
  value       = module.watson_discovery.account_id
}

output "id" {
  description = "ID of the Watson Discovery instance."
  value       = module.watson_discovery.id
}

output "crn" {
  description = "The CRN of the Watson Discovery instance."
  value       = module.watson_discovery.crn
}

output "guid" {
  description = "The GUID of the Watson Discovery instance."
  value       = module.watson_discovery.guid
}

output "name" {
  description = "The name of the Watson Discovery instance."
  value       = module.watson_discovery.name
}

output "plan_id" {
  description = "The plan ID of the Watson Discovery instance."
  value       = module.watson_discovery.plan_id
}

output "dashboard_url" {
  description = "The dashboard URL of the Watson Discovery instance."
  value       = module.watson_discovery.dashboard_url
}
