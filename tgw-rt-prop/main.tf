resource "aws_ec2_transit_gateway_route_table_propagation" "example" {
  transit_gateway_attachment_id  = "${var.tgw_attach_id}"
  transit_gateway_route_table_id = "${var.tgw_rt_id}"
}