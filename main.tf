provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [var.aws_security_group]
  user_data = file("userdata.sh")
  count = 2
  tags = {
    Name = "Merver-${count.index + 1}"
  }
}


