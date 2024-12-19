########################################################################################################################
# Outputs
########################################################################################################################

output "account_id" {
  description = "Account ID of the watson Discovery instance."
  value       = local.account_id
}

output "id" {
  description = "ID of the watson Discovery instance."
  value       = local.watson_discovery_id
}

output "crn" {
  description = "The CRN of the Watson Discovery instance."
  value       = local.watson_discovery_crn
}

output "guid" {
  description = "The GUID of the Watson Discovery instance."
  value       = local.watson_discovery_guid
}

output "name" {
  description = "The name of the Watson Discovery instance."
  value       = local.watson_discovery_name
}

output "plan_id" {
  description = "The plan ID of the Watson Discovery instance."
  value       = local.watson_discovery_plan_id
}

output "dashboard_url" {
  description = "The dashboard URL of the Watson Discovery instance."
  value       = local.watson_discovery_dashboard_url
}
