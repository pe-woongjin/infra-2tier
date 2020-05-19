resource "aws_route_table" "pub-rt" {
  vpc_id       = aws_vpc.vpc.id
  count        = length(var.public_rt_tag_names)
  depends_on   = [ aws_internet_gateway.igw ]

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.igw.id
  }

  tags = {
    Name          = "${local.resrc_prefix_nm}-${lookup(var.public_rt_tag_names[count.index], "Name")}"
    Environment   = var.environment
  }
}

resource "aws_route_table_association" "pub-rt-ac" {
  count           = length(aws_subnet.pub-sn)

  subnet_id       = aws_subnet.pub-sn.*.id[count.index]
  route_table_id  = aws_route_table.pub-rt.*.id[0]
}