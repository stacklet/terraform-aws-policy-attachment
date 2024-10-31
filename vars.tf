variable "resource_type" {
  description = "Type of resource to which the policy applies. Supports: 'aws_s3_bucket' or 'aws_secretsmanager_secret'"
  type        = string

  validation {
    condition     = contains(["aws_s3_bucket", "aws_secretsmanager_secret"], var.resource_type)
    error_message = "resource_type must be one of 'aws_s3_bucket' or 'aws_secretsmanager_secret'."
  }
}

variable "resource_arn" {
  description = "The ARN of the resource to attach the policy to."
  type        = string
}

variable "policy" {
  description = "The policy to apply."
  type        = string
}