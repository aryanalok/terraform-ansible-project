resource "aws_key_pair" "terra-key" {
    key_name = "${var.env}-terra-ansible-key"
    public_key = file("terra-ansible-key.pub")
  
}

resource "aws_default_vpc" "terra-vpc" {

  tags = {
    Name = "${var.env}-terra-vpc"
  }
}

resource "aws_security_group" "terra-sg" {
    name = "${var.env}-terra-sg"
    vpc_id =  aws_default_vpc.terra-vpc.id
    description = "terra with ansible security group" 

    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        description = "http port"
    }
    ingress {
        from_port = 443
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        description = "https port"
    }
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        description = "ssh port"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${var.env}-terra-sg"
    }
}

resource "aws_instance" "terra-instance" {
    count = var.instance_count
    ami = var.ami_id
    key_name = aws_key_pair.terra-key.key_name
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.terra-sg.id]

    root_block_device {
      volume_size = var.root_block_device
      volume_type = "gp3"
    }

    tags = {
      Name = "${var.env}-terra-instance"
      Environment = var.env
    }
  
}
