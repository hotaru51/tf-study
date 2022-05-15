variable "example_instance_type" {
    default = "t2.micro"
}

locals {
    example_ami_id = "ami-0bcc04d20228d0cf6"
}

resource "aws_instance" "tf-example" {
    # TODO:最新のAmazon Linuxのバージョンを指定できるように変更する
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
