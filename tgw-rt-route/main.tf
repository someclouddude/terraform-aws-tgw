resource "aws_ec2_transit_gateway_route" "this" {
  destination_cidr_block         = "${var.dest_cidr_block}"
  transit_gateway_attachment_id  = "${var.tgw_attach_id}"
  transit_gateway_route_table_id = "${var.tgw_rt_id}"
}