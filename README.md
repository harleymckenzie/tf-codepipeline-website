# hmckenzie.net Terraform Stack

**Note**: This stack was created for the purpose of my own personal portfolio website.

While there are customisable variables, I have set the default and flexibility to match my own personal needs.

## Requirements
- S3 Bucket
  - A bucket containing the static web content (I'm personally using Hugo)
  - Another bucket to store the CodePipeline artifacts
- Your own domain hosted in Route 53
- A Key Pair in the region this is being deployed in
- A connection to have been manually created to your repo in CodePipeline 


## Variables
- web-bucket - Bucket containing static media content
- codepipelinebucket - Artifact bucket

- AMI - The AMI ID of the AMI used for the ASG (Currently set to Amazon Linux 2 in eu-west-1)
- KeyName - The Key Pair to be used on the EC2 instance

- HostName - The hostname to be used for the frontend

- ConnectionArn - The ARN of the pre-existing connection to GitHub

#### Diagram
![hmckenzie-net-cfn-diagram](https://hmckenzie-public.s3.eu-west-1.amazonaws.com/media/hmckenzie.net+-+AWS.jpg)

# Author
[Harley McKenzie](https://hmckenzie.net) - Creator