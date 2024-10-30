variable "resource_type" {
  description = "Type of resource to which the policy applies, e.g., 's3_bucket' or 'secrets_manager_secret'"
  type        = string
}

variable "resource_id" {
  description = "The ID or ARN of the resource to attach the policy to."
  type        = string
}

variable "policy" {
  description = "The policy to apply."
  type        = string
}