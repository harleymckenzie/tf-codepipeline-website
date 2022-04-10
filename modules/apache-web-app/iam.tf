########################################################
# IAM Role
########################################################

resource "aws_iam_role" "web" {
    name = "${var.name}-webapp-role"
    path = "/"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid    = ""
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            },
        ]
    })
}

########################################################
# IAM Instance Profile
########################################################

resource "aws_iam_instance_profile" "web" {
  name = "${var.name}-web-profile"
  role = aws_iam_role.web.name
}

resource "aws_iam_role_policy_attachment" "ssm-managed-instance" {
  role       = aws_iam_role.web.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
