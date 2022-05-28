provider "aws" {
    region = "ap-northeast-1"
}

data "aws_ami" "recent_amazon_linux_2" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "state"
        values = ["available"]
    }

    filter {
        name = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-?.?.????????.?-x86_64-gp2"]
    }
}

variable "example_instance_type" {
    default = "t2.micro"
}

locals {
    example_ami_id = data.aws_ami.recent_amazon_linux_2.image_id
}

resource "aws_security_group" "tf-example-sg" {
    name = "tf-example-sg"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "tf-example" {
    ami           = local.example_ami_id
    instance_type = var.example_instance_type
    vpc_security_group_ids = [aws_security_group.tf-example-sg.id]

    tags = {
        Name = "tf-example"
        env  = "dev"
    }

    user_data = file("./user_data.sh")
}

output "example_instance_id" {
    value = aws_instance.tf-example.id
}
