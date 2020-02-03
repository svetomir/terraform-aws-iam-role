variable "name" {
    type        = string
    description = "The name of the role."
}

variable "name_prefix" {
    type        = string
    default     = null
    description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
}

variable "description" {
    type        = string
    default     = ""
    description = "The description of the role."
}

variable "force_detach_policies" {
    type        = bool
    default     = false
    description = "Specifies to force detaching any policies the role has before destroying it."
}

variable "max_session_duration" {
    type        = number
    default     = 3600
    description = "The maximum session duration (in seconds) that you want to set for the specified role. This setting can have a value from 1 hour to 12 hours."
}

variable "mfa_age" {
    description = "Grants access only within a specified time after MFA authentication (in seconds)."
    default     = 86400
}

variable "path" {
    type        = string
    default     = "/"
    description = "Path in which to create the group."
}

variable "permissions_boundary" {
    type        = string
    default     = ""
    description = "The ARN of the policy that is used to set the permissions boundary for the role."
}

variable "policy_arns" {
    type        = list(string)
    default     = []
    description = "The list of IAM policy ARNs to attach to the role."
}

variable "require_mfa" {
    type        = bool
    default     = false
    description = "Require MFA from AWS trusted entities which assume this role."
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "Key-value mapping of default tags for the role."
}

variable "trusted_arns" {
    type        = list(string)
    default     = []
    description = "ARNs of AWS trusted entities which can assume this role."
}

variable "trusted_services" {
    type        = list(string)
    default     = []
    description = "AWS services that can assume this role."
}
