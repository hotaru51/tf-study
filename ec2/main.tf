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

resource "aws_instance" "tf-example" {
    ami           = local.example_ami_id
    instance_type = var.example_instance_type

    tags = {
        Name = "tf-example"
        env  = "dev"
    }

    user_data = <<EOF
#!/bin/bash
yum install -y httpd
systemctl enable httpd.service
systemctl start httpd.service
    EOF
}

output "example_instance_id" {
    value = aws_instance.tf-example.id
}
