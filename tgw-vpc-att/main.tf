resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids                                      = "${var.subnet_ids}"
  transit_gateway_id                              = "${var.tgw_id}"
  vpc_id                                          = "${var.vpc_id}"
  dns_support                                     = "${var.dns_support}"
  ipv6_support                                    = "${var.ipv6_support}"
  tags                                            = "${merge(var.tags, var.local_tags)}"
  transit_gateway_default_route_table_association = "${var.default_rt_assoc}"
  transit_gateway_default_route_table_propagation = "${var.default_rt_prop}"
}
