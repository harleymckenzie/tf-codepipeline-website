resource "aws_codepipeline" "codepipeline" {
    name = "web-pipeline"
    role_arn = aws_iam_role.codepipeline.arn

    artifact_store {
        location = var.codepipeline-bucket
        type = "S3"
    }

    stage {
        name = "Source"

        action {
            name = "Source GitHub"
            category = "Source"
            owner = "AWS"
            provider = "CodeStarSourceConnection"
            version = "1"
            output_artifacts = ["source_output"]

            configuration = {
                ConnectionArn = var.codestar-connection-arn
                FullRepositoryId = "Milkeh/hmckenzie-web"
                BranchName = "main"
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
                ApplicationName = 
                DeploymentGroupName =
            }
        }
    }

    
}