output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "pub_sn_ids" {
  value = aws_subnet.pub-sn.*.id
}