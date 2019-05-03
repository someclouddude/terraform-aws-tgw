output "tgw_rt_assoc_id" {
    description = ""
    value = "${aws_ec2_transit_gateway_route_table_association.this.id}"
}
output "tgw_rt_assoc_resource_id" {
    description = ""
    value = "${aws_ec2_transit_gateway_route_table_association.this.resource_id}"
}
output "tgw_rt_resource_type" {
    description = ""
    value = "${aws_ec2_transit_gateway_route_table_association.this.resource_type}"
}
