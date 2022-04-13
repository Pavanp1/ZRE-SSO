resource "aws_security_group" "mydemo-ec2-sg" {
    name = "my-demo-tf-sg"
    
    ingress {
        description      = "to ssh into ec2"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]

    }
  
    ingress  {
        description      = "to web into ec2"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks       = ["0.0.0.0/0"]

    }

    egress  {
        description = "to allow port outbound"
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}