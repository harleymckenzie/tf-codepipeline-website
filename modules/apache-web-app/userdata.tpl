#!/bin/bash -ex
yum update -y
yum install -y ruby wget
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
cd /home/ec2-user;wget https://aws-codedeploy-${region}.s3.${region}.amazonaws.com/latest/install
chmod +x ./install
./install auto