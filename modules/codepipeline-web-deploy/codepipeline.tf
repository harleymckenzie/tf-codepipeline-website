resource "aws_codepipeline" "codepipeline" {
    name = "${var.name}-web-pipeline"
    role_arn = aws_iam_role.codepipeline.arn

    depends_on = [aws_codedeploy_deployment_group.web]
    artifact_store {
        location = var.codepipeline_bucket
        type = "S3"
    }

    stage {
        name = "Source"

        action {
            name = "Source"
            category = "Source"
            owner = "AWS"
            provider = "CodeStarSourceConnection"
            version = "1"
            output_artifacts = ["source_output"]

            configuration = {
                ConnectionArn = var.codestar_connection_arn
                FullRepositoryId = var.repository_id
                BranchName = var.branch
            }
        }
    }

    stage {
        name = "Deploy"

        action {
            name = "Deploy"
            category = "Deploy"
            owner = "AWS"
            provider = "CodeDeploy"
            version = "1"
            input_artifacts = ["source_output"]

            configuration = {
                ApplicationName = aws_codedeploy_app.webapp.name
                DeploymentGroupName = "${var.name}-web-asg"
            }
        }
    }


}

resource "aws_codedeploy_app" "webapp" {
    name = "${var.name}-WebApp"
    compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "web" {
    app_name = aws_codedeploy_app.webapp.name
    deployment_group_name = "${var.name}-web-asg"
    service_role_arn = aws_iam_role.codedeploy.arn
    autoscaling_groups = var.asg_list
}