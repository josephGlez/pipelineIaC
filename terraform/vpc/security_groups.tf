resource "aws_security_group" "joe_elb" {
  name        = "joe_elb_sg_${var.vpc_name}"
  description = "Allow SSH from ELB SG"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name   = "joe_elb_sg_${var.vpc_name}"
    Author = "terraform-example-joe"
    Tool   = "Terraform"
  }
}

resource "aws_security_group" "joe_host" {
  name        = "joe_sg_${var.vpc_name}"
  description = "Allow SSH from ELB SG"
  vpc_id      = "${aws_vpc.default.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.joe_elb.id}"]
  }

  tags {
    Name   = "joe_sg_${var.vpc_name}"
    Author = "terraform-example-joe"
    Tool   = "Terraform"
  }
}
