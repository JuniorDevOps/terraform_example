provider "aws" {
  region = var.region
}

resource "aws_instance" "stage" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [var.aws_security_group]
  user_data = file("servers_data.sh")
  count = 2
  tags = {
    Name = "Shmage-${count.index + 1}"
  }
}

resource "aws_instance" "prod" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [var.aws_security_group]
  user_data = file("servers_data.sh")
  count = 2
  tags = {
    Name = "Prod-${count.index + 1}"
  }
}


