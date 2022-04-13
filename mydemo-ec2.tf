#Availability zone datasource

data "aws_availability_zones" "my-az" {

    filter {
      

    name = "opt-in-status"
    values = [ "opt-in-not-required" ]
    } 
}
 
resource "aws_instance" "my_ec2" {
    ami = data.aws_ami.amzlinux2.id
    #instance_type = var.instance-type-list[1]
    instance_type = var.instance-type-map["prod"]
    user_data = file ("${path.module}/web_script.sh")
    key_name = var.key-pair
    vpc_security_group_ids = [aws_security_group.mydemo-ec2-sg.id]
    for_each = toset (data.aws_availability_zones.my-az.names)
    availability_zone = each.key
     
    tags = {
        Name = "my-tf-each-demo${each.key}"
    }   

}