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

output "next_steps_text" {
  value       = "Now, you can launch the Watson Discovery tool to create a project or manage your sample collections."
  description = "Next steps text"
}

output "next_step_primary_label" {
  value       = "Go to Watson Discovery service dashboard"
  description = "Primary label"
}

output "next_step_primary_url" {
  value       = "${module.watson_discovery.dashboard_url}?paneId=manage"
  description = "Primary URL"
}

output "next_step_secondary_label" {
  value       = "Learn more about Watson Discovery"
  description = "Secondary label"
}

output "next_step_secondary_url" {
  value       = "https://cloud.ibm.com/docs/discovery-data?topic=discovery-data-getting-started"
  description = "Secondary URL"
}
