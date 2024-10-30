resource "aws_s3_bucket_policy" "this" {
  count  = startswith(var.resource_arn, "arn:aws:s3:") ? 1 : 0
  bucket = var.resource_arn

  policy = jsonencode({
    Version   = lookup(local.policy, "Version", null),
    Statement = [
      for statement in lookup(local.policy, "Statement", []) :
      merge(
        statement,
        {
          Resource = "${var.resource_arn}/*"
        }
      )
    ]
  })
}

resource "aws_secretsmanager_secret_policy" "this" {
  count      = startswith(var.resource_arn, "arn:aws:secretsmanager:") ? 1 : 0
  secret_arn = var.resource_arn

  policy = jsonencode({
    Version   = lookup(local.policy, "Version", null),
    Statement = [
      for statement in lookup(local.policy, "Statement", []) :
      merge(
        statement,
        {
          Resource = var.resource_arn
        }
      )
    ]
  })
}
