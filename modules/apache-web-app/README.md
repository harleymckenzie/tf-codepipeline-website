# Apache ASG Terraform module
Terraform module to provision an ASG preconfigured with:
* Apache
* The CodeDeploy agent

While I've added the ability to specify the min and max count of the ASG, I haven't yet had a need to increase this to a size bigger than 1, so I haven't included a Scaling Policy.

## Usage
```hcl
module "apache-web-app" {
    name = "my-web-app"
    instance_type = "t2.micro"
    
    vpc_id = "vpc-xxxxxx"
    subnet_ids = ["subnet-xxxxxxx, subnet-xxxxxxx"]
    ami_id = "ami-abcd1234"
    permitted_ssh_ips = ["1.2.3.4, 4.3.2.1"]
    key_pair = "my_key_pair"

    asg_min = 1
    asg_max = 2
}
```

## Authors
Module is maintained by Harley McKenzie