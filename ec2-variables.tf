variable "region" {
    type = string
    default = "us-east-1"
  
}

variable "instance-type-list" {
    type = list(string)
    default = ["t2.small","t2.micro","t3.small"]
  
}

variable "instance-type-map" {
    type = map(string)
    default = {
      "dev" = "t3.small"
      "uat" = "t2.small"
      "prod"= "t3.micro"
    }
  
}
variable "key-pair" {
    type = string
    default = "tf-us-key"
}
