output "VPC ID" {
  value = "${aws_vpc.default.id}"
}

output "Public Subnets" {
  value = "${aws_subnet.public_subnets.*.id}"
}

output "Private Subnets" {
  value = "${aws_subnet.private_subnets.*.id}"
}

output "joe DNS" {
  value = "${aws_route53_record.joe.name}"
}

output "joe SG ID" {
  value = "${aws_security_group.joe_host.id}"
}
