output "pub_sn_ids" {
  value = aws_subnet.pub-sn.*.id
}