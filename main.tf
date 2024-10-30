data "aws_arn" "this" {
  arn = "arn:aws:rds:eu-west-1:123456789012:db:mysql-db"
}

resource "aws_s3_bucket_policy" "this" {
  count  = data.aws_arn.this.service == "s3" ? 1 : 0
  bucket = data.aws_arn.this.resource

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
  count      = data.aws_arn.this.service == "secretsmanager" ? 1 : 0
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
