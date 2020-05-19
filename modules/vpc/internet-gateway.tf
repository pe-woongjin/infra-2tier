resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name          = "${local.resrc_prefix_nm}-igw"
    Environment   = var.environment
  }
}