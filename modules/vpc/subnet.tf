resource "aws_subnet" "pub-sn" {
  vpc_id                    = aws_vpc.vpc.id
  count                     = length(var.pub_sn_list)
  cidr_block                = lookup(var.pub_sn_list[count.index], "cidr_block")
  availability_zone         = lookup(var.pub_sn_list[count.index], "availability_zone")
  depends_on                = [ aws_route_table.pub-rt ]

  map_public_ip_on_launch   = true

  tags = {
    Name          = "${local.resrc_prefix_nm}-${lookup(var.pub_sn_list[count.index], "Name")}"
    Environment   = var.environment
  }
}