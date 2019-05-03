output "tgw_arn" {
    description = "EC2 Transit Gateway Amazon Resource Name (ARN)"
    value = ""
}

output "tgw_id" {
    description = "EC2 Transit Gateway identifier."
    value = ""
}

output "tgw_owner_id" {
    description = "Identifier of the AWS account that owns the EC2 Transit Gateway"
    value = "${data.aws_caller_identity.current.account_id}"
}

output "tgw_asn" {
    description = "Private Autonomous System Number (ASN) for the Amazon side of a BGP session."
    value = "${aws_ec2_transit_gateway.this.amazon_side_asn}"
}