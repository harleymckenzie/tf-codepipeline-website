output "vpc_id" {
    value = aws_vpc.vpc.id
    description = "VPC id"
}

output "subnet_public-a" {
    value = aws_subnet.public-a.id
    description = "Subnet id of Public Subnet A"
}

output "subnet_public-b" {
    value = aws_subnet.public-b.id
    description = "Subnet id of Public Subnet B"
}

output "subnet_public-c" {
    value = aws_subnet.public-c.id
    description = "Subnet id of Public Subnet C"
}

output "subnet_private-a" {
    value = aws_subnet.private-a.id
    description = "Subnet id of Private Subnet A"
}

output "subnet_private-b" {
    value = aws_subnet.private-b.id
    description = "Subnet id of Private Subnet B"
}

output "subnet_private-c" {
    value = aws_subnet.private-c.id
    description = "Subnet id of Private Subnet C"
}