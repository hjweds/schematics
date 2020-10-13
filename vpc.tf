##############################################################################
# This file creates the VPC, Zones, subnets and public gateway for the VPC
##############################################################################


##############################################################################
# Create a VPC
##############################################################################
/*
resource ibm_is_vpc vpc {
  name           = "${var.unique_id}-vpc"
  resource_group = data.ibm_resource_group.resource_group.id
}

##############################################################################


##############################################################################
# Public Gateways
##############################################################################

resource ibm_is_public_gateway gateway {
  count          = var.zones
  name           = "${var.unique_id}-gateway-${count.index + 1}"
  vpc            = ibm_is_vpc.vpc.id
  resource_group = data.ibm_resource_group.resource_group.id
  zone  = var.ibm_region
}

##############################################################################


##############################################################################
# Address prefixes
##############################################################################

resource ibm_is_vpc_address_prefix subnet_prefix {
  count = length(var.cidr_blocks)
  name  = "${var.unique_id}-prefix-zone-${count.index + 1}" 
  zone  = var.ibm_region
  vpc   = ibm_is_vpc.vpc.id
  cidr  = element(var.cidr_blocks, count.index)
}

##############################################################################


##############################################################################
# Subnets
##############################################################################

resource ibm_is_subnet subnet {
  count                    = var.zones
  name                     = "${var.unique_id}-subnet-${count.index + 1}"
  vpc                      = ibm_is_vpc.vpc.id
  resource_group           = data.ibm_resource_group.resource_group.id
  zone                     = var.ibm_region
  ipv4_cidr_block          = element(ibm_is_vpc_address_prefix.subnet_prefix.*.cidr, count.index)
  public_gateway           = element(ibm_is_public_gateway.gateway.*.id, count.index)
}

##############################################################################

##############################################################################
# Change Default Security Group to allow inbound 
##############################################################################

resource ibm_is_security_group_rule allow_all_inbound {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "0.0.0.0/0"
}
*/
##############################################################################