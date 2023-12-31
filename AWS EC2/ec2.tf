resource "aws_instance" "ec2_dev" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  key_name        = var.ami_key_pair_name
  security_groups = [aws_security_group.ALLOW_SSH.id]
  tags = {
    Name = "${var.ami_name}"
  }
  subnet_id = aws_subnet.subnet_dev.id
}

