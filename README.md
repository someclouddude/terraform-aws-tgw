# AWS Transit Gateway

This collection of modules would be used to assemble a working transit gateway. They're broken out into components to make it easier to add attachments and routes as required. A basic Transit Gateway would require at least one of each of these modules. 

All modules don't have to exist in the same configuration but if the routes and attachments get spread out it'll be difficult to track them down without referring to state. This is complicated because transit gateways can be shared across accounts.


* TGW's are not currently multi-region, one per region will be required. A TGW costs $.05/hour.

* A VPC is attached to a TGW via a subnet, one per AZ is recommended. This is called a "Transit Gateway Attachment". A TGW attachment is \$0.02/GB and includes all the subnets configured, it is not \$0.02 per subnet.

* A VPC subnet can only be a member of a single TGW attachment.

* The Transit Gateway Attachment is associated with exactly one route table, similar to a VPC route table. It makes the most sense for us to have a RT per environment.
    
* Just like a VPC the routes need to be propagated and that propagation includes all VPC CIDRs by default. These can, and probably should, be individually configured. More on that later.

* A VPC can be associated with more than one RT and TGW as long as there is a subnet available for attachment. (Possibly a dedicated subnet /28 for each AZ for every attachment.)

* TGWs can be shared with other accounts using AWS Resource Access Manager. This is done by either specifying the account numbers as the principal or the AWS Organization ARN or Org:OU ARN. Right now there is a bug when using the Org or Org:AU, the branch is active.

## Example config.
There currently isn't an example from the Terraform docs that put this all together. Here is an example config.

In the account hosting the TGW create only the Transit Gateway. Sane values are set to false to prevent automatic attachment and propagation. For TGWs that are only used within an Org:OU some could be set to true, see the module variable descriptions for more information.
```
# Create the TGW
module "tcds_dev_tgw" {
    source = "./tgw"
    ...
}
```
This section is for the VPC config and would be configured at the environment level. Example for dev: tcds-infra/environments/dev/transit-gateway. Each section below the route table would include a module for each VPC to attach to that route table. This could also be done with `count` to simplify environments with a large number of VPCs.

```
# dev -- 
# Create the route table
module "tcds_dev_tgw_rt" {
    source = "./tgw-route-table"
    ...
}

##########################################################################
# Each VPC attaching to the route table would need the following defined:#
# - TGW Attachment
# - TGW RT Association 
# - TGW Route 
# - TGW RT Propagation
##########################################################################

######################################
# Create TGW attachments, one per VPC#
######################################

module "tcds_dev_tgw_attach_common" {
    source = "./tgw_vpc_attach"
    ...
}

module "tcds_dev_tgw_attach_platform" {
    source = "./tgw_vpc_attach"
    ...
}

module "tcds_dev_tgw_attach_product" {
    source = "./tgw_vpc_attach"
    ...
}

#####################################################
# Associate the TGW attachments with the route table#
#####################################################

module "tcds_dev_common_to_tcds_dev_tgw_rt" {
    source = "./tgw-rt-assoc"
    ...
}

module "tcds_dev_platform_to_tcds_dev_tgw_rt" {
    source = "./tgw-rt-assoc"
    ...
}

module "tcds_dev_product_to_tcds_dev_tgw_rt" {
    source = "./tgw-rt-assoc"
    ...
}

#######################################
# TGW routes, if not set to automatic.#
#######################################

module "tcds_dev_common_route" {
    source = "./tgw-rt-route"
    ...
}

module "tcds_dev_platform_route" {
    source = "./tgw-rt-route"
    ...
}

module "tcds_dev_product_route" {
    source = "./tgw-rt-route"
    ...
}

###############################################
# TGW RT propagation, if not set to automatic.#
###############################################

module "tcds_dev_common_rt_prop" {
    source = "./tgw-rt-prop"
    ...
}

module "tcds_dev_platform_rt_prop" {
    source = "./tgw-rt-prop"
    ...
}

module "tcds_dev_product_rt_prop" {
    source = "./tgw-rt-prop"
    ...
}
```