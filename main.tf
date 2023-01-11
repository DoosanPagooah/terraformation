provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "example"{
    ami = "ami-0fb653ca2d3203ac1"
    instance_type="t2.micro"
    vpc_security_group_ids = [ aws_security_group.instance.id ]

    user_data  = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
    
/*
Since you set user_data_replace_on_change to true and changed the user_data
parameter, this will force a replacement, which means that the original EC2 Instance
will be terminated and a completely new Instance will be created. 
*/

    user_data_replace_on_change = true

    tags = {
    Name = "terraform-example"
    }
}

resource "aws_security_group" "instance"{
    name = "terraform-example-instance"

    ingress {
        from_port = var.server_port
        to_port   = var.server_port 
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
}