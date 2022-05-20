#!/bin/bash

yum install -y httpd
systemctl enable httpd.service
systemctl start httpd.service
