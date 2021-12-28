output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "subnet_public-a" {
    value = aws_subnet.public-a.id
}

output "subnet_public-b" {
    value = aws_subnet.public-b.id
}

output "subnet_public-c" {
    value = aws_subnet.public-c.id
}

output "subnet_private-a" {
    value = aws_subnet.private-a.id
}

output "subnet_private-b" {
    value = aws_subnet.private-b.id
}

output "subnet_private-c" {
    value = aws_subnet.private-c.id
}