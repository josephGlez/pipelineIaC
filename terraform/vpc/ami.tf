data "aws_ami" "joe" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["joe-2018.03.0"]
  }
}
