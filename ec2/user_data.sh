#!/bin/bash

yum update -y
yum install -y httpd
systemctl enable httpd.service
systemctl start httpd.service
