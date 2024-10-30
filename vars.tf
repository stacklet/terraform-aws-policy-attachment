variable "resource_arn" {
  description = "The ARN of the resource to attach the policy to."
  type        = string
}

variable "policy" {
  description = "The policy to apply."
  type        = string
}