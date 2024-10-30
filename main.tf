resource "aws_s3_bucket_policy" "this" {
  count  = var.resource_type == "aws_s3_bucket" ? 1 : 0
  bucket = var.resource_id

  policy = jsonencode({
    Version   = lookup(local.policy, "Version", null),
    Statement = [
      for statement in lookup(local.policy, "Statement", []) :
      merge(
        statement,
        {
          Resource = "${var.resource_id}/*"
        }
      )
    ]
  })
}

resource "aws_secretsmanager_secret_policy" "this" {
  count     = var.resource_type == "aws_secrets_manager_secret" ? 1 : 0
  secret_arn = var.resource_id

  policy = jsonencode({
    Version   = lookup(local.policy, "Version", null),
    Statement = [
      for statement in lookup(local.policy, "Statement", []) :
      merge(
        statement,
        {
          Resource = var.resource_id
        }
      )
    ]
  })
}
