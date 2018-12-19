// joe host launch configuration
resource "aws_launch_configuration" "joe_conf" {
  name            = "joe"
  image_id        = "${data.aws_ami.joe.id}"
  instance_type   = "${var.joe_instance_type}"
  key_name        = "${var.joe_key_name}"
  security_groups = ["${aws_security_group.joe_host.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

// joe ASG
resource "aws_autoscaling_group" "joe_asg" {
  name                 = "joe_asg_${var.vpc_name}"
  launch_configuration = "${aws_launch_configuration.joe_conf.name}"
  vpc_zone_identifier  = ["${aws_subnet.public_subnets.*.id}"]
  load_balancers       = ["${aws_elb.joe_hosts_elb.name}"]
  min_size             = 1
  max_size             = 1

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "joe"
    propagate_at_launch = true
  }

  tag {
    key                 = "Author"
    value               = "terraform-example-joe"
    propagate_at_launch = true
  }

  tag {
    key                 = "Tool"
    value               = "Terraform"
    propagate_at_launch = true
  }
}
