########################################################################################################################
# Outputs
########################################################################################################################

output "watson_discovery_crn" {
  description = "The CRN of the Watson Discovery instance."
  value       = local.watson_discovery_crn
}

output "watson_discovery_guid" {
  description = "The GUID of the Watson Discovery instance."
  value       = local.watson_discovery_guid
}

output "watson_discovery_name" {
  description = "The name of the Watson Discovery instance."
  value       = local.watson_discovery_name
}

output "watson_discovery_plan_id" {
  description = "The plan ID of the Watson Discovery instance."
  value       = local.watson_discovery_plan_id
}

output "watson_discovery_dashboard_url" {
  description = "The dashboard URL of the Watson Discovery instance."
  value       = local.watson_discovery_dashboard_url
}

output "resource_group_id" {
  value       = module.resource_group.resource_group_id
  description = "The resource group ID that's used to provision the resources."
}
