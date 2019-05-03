variable "amazon_side_asn" {
  description = "Private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs. AWS Default value: 64512."
  type        = "string"
  default     = 64575
}

variable "auto_accept_shared_attachments" {
  description = "Whether resource attachment requests are automatically accepted. Valid values: disable, enable."
  type        = "string"
  default     = "disable"
}

variable "default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table. Valid values: disable, enable."
  type        = "string"
  default     = "disable"
}

variable "default_route_table_propagation" {
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: disable, enable."
  type        = "string"
  default     = "disable"
}

variable "tgw_description" {
  description = "Description of the EC2 Transit Gateway."
  type        = "string"
  default = "none"
}

variable "dns_support" {
  description = "Whether DNS support is enabled."
  type        = "string"
  default     = "enable"
}

variable "tags" {
  description = "Key-value tags for the EC2 Transit Gateway."
  type        = "map"
  default = {
    test = "yes"
  }
}

variable "vpn_ecmp_support" {
  description = "Whether VPN Equal Cost Multipath Protocol support is enabled. Valid values: disable, enable."
  type        = "string"
  default     = "enable"
}

variable "local_tags" {
  description = "Local tags to override the globals for the VPC"
  type        = "map"
  default = {
    test-local = "yes"
  }
}
