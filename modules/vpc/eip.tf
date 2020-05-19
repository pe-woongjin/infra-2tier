resource "aws_eip" "eip" {
  vpc         = true
  depends_on  = [ aws_internet_gateway.igw ]

  tags = {
    Name          = "${local.resrc_prefix_nm}-eip"
    Environment   = var.environment
  }
}