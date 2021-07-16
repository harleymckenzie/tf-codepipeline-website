#!/bin/bash -ex
yum update -y
yum install -y ruby wget
cd /home/ec2-user;wget https://aws-codedeploy-${region}.s3.${region}.amazonaws.com/latest/install
chmod +x ./install
./install auto