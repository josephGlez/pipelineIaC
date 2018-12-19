// joe ELB
resource "aws_elb" "joe_hosts_elb" {
  subnets                   = ["${aws_subnet.public_subnets.*.id}"]
  cross_zone_load_balancing = true
  security_groups           = ["${aws_security_group.joe_elb.id}"]

  listener {
    instance_port     = 22
    instance_protocol = "tcp"
    lb_port           = 22
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 30
  }

  tags {
    Name   = "joe_elb_${var.vpc_name}"
    Author = "terraform-example-joe"
    Tool   = "Terraform"
  }
}
