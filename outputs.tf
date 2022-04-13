output "ec2-ip" {
    description = "ec2 public ip"
    #value = aws_instance.my_ec2[*].public_ip
    value = [for ip in aws_instance.my_ec2 : ip.public_ip]
  
}
/*
output "ec-public-dns" {
    description = "ec2 public dns"
    value = aws_instance.my_ec2.public_dns
  
}
*/
output "instance-for-loop-list" {
    description = "for loop on list for instace outputs"
    value = [for instance in aws_instance.my_ec2 : instance.public_dns ]

}
output "instance-for-loop-map" {
    description = "for loop on list for instance outputs"
    value = {for instance-m in aws_instance.my_ec2 : instance-m.id => instance-m.public_dns}
  
}
output "splat_operator" {
 description = "latest splat operator"
 #value = aws_instance.my_ec2[*].public_dns 
 value = [for dns in aws_instance.my_ec2 : dns.public_dns]
}