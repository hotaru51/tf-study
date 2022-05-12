variable "example_instance_type" {
    default = "t2.micro"
}

resource "aws_instance" "tf-example" {
    # TODO:最新のAmazon Linuxのバージョンを指定できるように変更する
    ami           = "ami-0bcc04d20228d0cf6"
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
