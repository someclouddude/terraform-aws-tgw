# AWS ec2 Transit Gateway

This module creates a Transit Gateway. This is is only the base configuration, additional modules are required for full functionality. All automatic routes and propagation are disabled as defaults in variables.tf. 

See the top level readme for more information about usability and full examples.

**Variables**
| Name                            | Description                                                                                        | Default | Type   | Required |
| ------------------------------- | -------------------------------------------------------------------------------------------------- | ------- | ------ | -------- |
| amazon_side_asn                 | Private Autonomous System Number (ASN) for the Amazon side of a BGP session                        | 64575   | string | yes      |
| auto_accept_shared_attachments  | Whether resource attachment requests are automatically accepted                                    | disable | string | yes      |
| default_route_table_association | Whether resource attachments are automatically associated with the default association route table | disable | string | yes      |
| default_route_table_propagation | Whether resource attachments automatically propagate routes to the default propagation route table | disable | string | yes      |
| tgw_description                 | Description of the EC2 Transit Gateway                                                             | None    | string | yes      |
| tgw_dns_support                 | Whether DNS support is enabled                                                                     | enable  | string | yes      |
| tags                            | Key-value tags for the EC2 Transit Gateway                                                         | globals | map    | yes      |
| vpn_ecmp_support                | Whether VPN Equal Cost Multipath Protocol support is enabled                                       | enable  | string | yes      |
| local_tags                      | Local tags to override the globals                                                                 | None    | map    | yes      |

**Example module config**
```
module "example_tgw_config" {
  source                          = "git...."  
  amazon_side_asn                 = "${var.}"
  auto_accept_shared_attachments  = "${var.}"
  default_route_table_association = "${var.}"
  default_route_table_propagation = "${var.}"
  description                     = "${var.}"
  dns_support                     = "${var.}"
  tags                            = "${merge(var.tags, var.local_tags)}"
  vpn_ecmp_support                = "${var.}"
}
```