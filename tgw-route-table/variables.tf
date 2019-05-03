variable "tgw_id" {
  description = " Identifier of EC2 Transit Gateway"
}

variable "tags" {
  type = "map"
  default = {
    test = "yes"
  }
  
}

variable "local_tags" {
  type = "map"
  default = {
    test_local = "yes"
  }
}
