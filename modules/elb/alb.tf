resource "aws_alb" "alb" {
  name                = "${local.resrc_prefix_nm}-alb"
  load_balancer_type  = "application"
  internal            = false
  subnets             = var.pub_sn_ids

  security_groups     = [ aws_security_group.alb-sg.id ]

  // NOTE there is a bug in terraform - it can't remove the lb and the whole destroy fails
  enable_deletion_protection = false

  tags = {
    Name          = "${local.resrc_prefix_nm}-alb"
    Environment   = var.environment
  }
}