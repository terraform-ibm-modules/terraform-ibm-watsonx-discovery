<!-- Update this title with a descriptive name. Use sentence case. -->
# IBM Watson Discovery module

<!--
Update status and "latest release" badges:
  1. For the status options, see https://terraform-ibm-modules.github.io/documentation/#/badge-status
  2. Update the "latest release" badge to point to the correct module's repo. Replace "terraform-ibm-module-template" in two places.
-->
[![Graduated (Supported)](https://img.shields.io/badge/status-Graduated%20(Supported)-brightgreen?style=plastic)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-watsonx-discovery?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-watsonx-discovery/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

<!--
Add a description of modules in this repo.
Expand on the repo short description in the .github/settings.yml file.

For information, see "Module names and descriptions" at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=module-names-and-descriptions
-->
The IBM Watson Discovery terraform module is designed to automate the deployment and configuration of IBM Watson Discovery,which is an intelligent document processing engine that helps to gain insights from complex business documents.

For further information on IBM Watson Discovery, including supported features, plans, and regions, please refer the official Watson Discovery [documentation](https://cloud.ibm.com/docs/discovery-data?topic=discovery-data-about)

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-watsonx-discovery](#terraform-ibm-watsonx-discovery)
* [Examples](./examples)
    * <div style="display: inline-block;"><a href="./examples/basic">Basic example</a></div> <div style="display: inline-block; vertical-align: middle;"><a href="https://cloud.ibm.com/schematics/workspaces/create?workspace_name=wd-basic-example&repository=https://github.com/terraform-ibm-modules/terraform-ibm-watsonx-discovery/tree/main/examples/basic" target="_blank"><img src="https://cloud.ibm.com/media/docs/images/icons/Deploy_to_cloud.svg" alt="Deploy to IBM Cloud button"></a></div>
    * <div style="display: inline-block;"><a href="./examples/existing-instance">Existing instance example</a></div> <div style="display: inline-block; vertical-align: middle;"><a href="https://cloud.ibm.com/schematics/workspaces/create?workspace_name=wd-existing-instance-example&repository=https://github.com/terraform-ibm-modules/terraform-ibm-watsonx-discovery/tree/main/examples/existing-instance" target="_blank"><img src="https://cloud.ibm.com/media/docs/images/icons/Deploy_to_cloud.svg" alt="Deploy to IBM Cloud button"></a></div>
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->


<!--
If this repo contains any reference architectures, uncomment the heading below and link to them.
(Usually in the `/reference-architectures` directory.)
See "Reference architecture" in the public documentation at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=reference-architecture
-->
<!-- ## Reference architectures -->


<!-- Replace this heading with the name of the root level module (the repo name) -->
## terraform-ibm-watsonx-discovery

This module supports provisioning the watson Discovery instance with a selectable service plan.

### Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl
module "watson_discovery" {
  source                = "terraform-ibm-modules/watsonx-discovery/ibm"
  watson_discovery_name = "watson-discovery"
  resource_group_id     = module.resource_group.resource_group_id
}

```

### Required access policies

<!-- PERMISSIONS REQUIRED TO RUN MODULE
If this module requires permissions, uncomment the following block and update
the sample permissions, following the format.
Replace the 'Sample IBM Cloud' service and roles with applicable values.
The required information can usually be found in the services official
IBM Cloud documentation.
To view all available service permissions, you can go in the
console at Manage > Access (IAM) > Access groups and click into an existing group
(or create a new one) and in the 'Access' tab click 'Assign access'.
-->

You need the following permissions to run this module:

* Account Management
  * **Resource Group**
        - `Viewer` role
* IAM Services
  * **Watson Discovery** service
        - `Editor` platform access

To attach access management tags to resources in this module, you need the following permissions.

- IAM Services
    - **Tagging** service
        - `Administrator` platform access

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.79.0, < 2.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_crn_parser"></a> [crn\_parser](#module\_crn\_parser) | terraform-ibm-modules/common-utilities/ibm//modules/crn-parser | 1.3.7 |

### Resources

| Name | Type |
|------|------|
| [ibm_resource_instance.watson_discovery_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [ibm_resource_tag.watson_discovery_tag](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_tag) | resource |
| [ibm_resource_instance.existing_watson_discovery_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_instance) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tags"></a> [access\_tags](#input\_access\_tags) | A list of access tags to apply to the Watson Discovery instance. [Learn more](https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial). | `list(string)` | `[]` | no |
| <a name="input_existing_watson_discovery_instance_crn"></a> [existing\_watson\_discovery\_instance\_crn](#input\_existing\_watson\_discovery\_instance\_crn) | The CRN of an existing Watson Discovery instance. If not provided, a new instance is created. | `string` | `null` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | The Watson Discovery plan to create an instance of Watson Discovery. Possible values are `plus` or `enterprise`. | `string` | `"plus"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region for the Watson Discovery instance. Required to create an instance of Watson Discovery. | `string` | `"us-south"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The resource group ID for the Watson Discovery instance. Required to create an instance of Watson Discovery. | `string` | `null` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | Optional list of tags to describe the Watson Discovery instance. | `list(string)` | `[]` | no |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | Types of the service endpoints that can be set to a Watson Discovery instance. Possible values are 'public', 'private', or 'public-and-private'. | `string` | `"public-and-private"` | no |
| <a name="input_watson_discovery_name"></a> [watson\_discovery\_name](#input\_watson\_discovery\_name) | The name of the Watson Discovery instance. Required to create a new instance. | `string` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | Account ID of the Watson Discovery instance. |
| <a name="output_crn"></a> [crn](#output\_crn) | The CRN of the Watson Discovery instance. |
| <a name="output_dashboard_url"></a> [dashboard\_url](#output\_dashboard\_url) | The dashboard URL of the Watson Discovery instance. |
| <a name="output_guid"></a> [guid](#output\_guid) | The GUID of the Watson Discovery instance. |
| <a name="output_id"></a> [id](#output\_id) | ID of the Watson Discovery instance. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Watson Discovery instance. |
| <a name="output_plan_id"></a> [plan\_id](#output\_plan\_id) | The plan ID of the Watson Discovery instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
