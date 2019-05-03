output "tgw_attach_subnet_ids" {
  value = "${aws_ec2_transit_gateway_vpc_attachment.this.*.subnet_ids}"
}
output "tgw_attach_id" {
    value = "${aws_ec2_transit_gateway_vpc_attachment.this.id}"
    description = "EC2 Transit Gateway Attachment identifier"
}
output "tgw_attach_vpc_owner_id" {
    value = "${aws_ec2_transit_gateway_vpc_attachment.this.vpc_owner_id}"
    description = "Identifier of the AWS account that owns the EC2 VPC"
}