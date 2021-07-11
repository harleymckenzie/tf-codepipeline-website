resource "aws_iam_role" "codepipeline" {
    name = "codepipeline-role"
    path = "/"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid    = ""
                Principal = {
                    Service = "codepipeline.amazonaws.com"
                }
            },
        ]
    })
}