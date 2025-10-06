output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "public_subnet_cidr_block" {
  value = aws_subnet.public.cidr_block
}

output "private_subnet1_id" {
  value = aws_subnet.private1.id
}

output "private_subnet1_cidr_block" {
  value = aws_subnet.private1.cidr_block
}

output "private_subnet2_id" {
  value = aws_subnet.private2.id
}

output "private_subnet2_cidr_block" {
  value = aws_subnet.private2.cidr_block
}