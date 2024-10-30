# terraform-aws-policy-attachment

## Example

```hcl
module "secretmanager_policy" {
  source = "github.com/stacklet/terraform-aws-policy-attachment"

  resource_arn = aws_secretsmanager_secret.example.arn
  policy = <<POLICY
  {
      "Version": "2012-10-17",
      "Statement": [
          {
             "Sid":"GlobalSecretsManagerPolicy",
             "Effect":"Allow",
             "Principal":{
                "type": "AWS",
                "identifiers": [
                   "arn:aws:iam::123456789123:root"
                ]
             },
             "Action":[
                "secretsmanager:*"
             ]
          }
      ]
  }
  POLICY
}
```