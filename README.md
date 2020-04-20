# Terraform AWS IAM Role

**terraform-aws-iam-role** is Terraform module for creating:
 * IAM Role
 * (optionally) attaching IAM policy to the IAM Role

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |
| aws provider | >= 2.47 |

## Inputs

| Name | Description | Required |
|------|-------------|----------|
| name | The name of the role. | true
| name_prefix | Creates a unique name beginning with the specified prefix. Conflicts with name. Defaults to **null**. | false
| description | The description of the role. Defaults to **""**. | false
| force_detach_policies | Specifies to force detaching any policies the role has before destroying it. Defaults to **false**. | false
| max_session_duration | The maximum session duration (in seconds) that you want to set for the specified role. This setting can have a value from 1 hour to 12 hours. Defaults to **3600**. | false
| mfa_age | Grants access only within a specified time after MFA authentication (in seconds). Defaults to **86400**. | false
| path | Path in which to create the group. Defaults to **/**. | false
| permissions_boundary | The ARN of the policy that is used to set the permissions boundary for the role. Defaults to **""**. | false
| policy_arns | The list of IAM policy ARNs to attach to the role. Defaults to **[]**. | false
| require_mfa | Require MFA from AWS trusted entities which assume this role. Defaults to **false**. | false
| tags | Key-value mapping of default tags for the role. Defaults to **{}**. | false
| trusted_arns | ARNs of AWS trusted entities which can assume this role. Defaults to **[]**. | false
| trusted_services | AWS services that can assume this role. Defaults to **[]**. | false

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) specifying the role. |
| create_date | The creation date of the IAM role. |
| description | The description of the role. |
| id | The name of the role. |
| name | The name of the role. |
| unique_id | The stable and unique string identifying the role. |
| policy_arns | The ARNs of the policies attached to the role. |
