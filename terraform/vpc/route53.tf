resource "aws_route53_record" "joe" {
  zone_id = "${var.hosted_zone_id}"
  name    = "joe.terraformAttempt.com"
  type    = "A"

  alias {
    name                   = "${aws_elb.joe_hosts_elb.dns_name}"
    zone_id                = "${aws_elb.joe_hosts_elb.zone_id}"
    evaluate_target_health = true
  }
}
