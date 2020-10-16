##############################################################################
# This file creates the VPC, Zones, subnets and public gateway for the VPC
##############################################################################


##############################################################################
# Create a VPC
##############################################################################

resource ibm_is_vpc vpc {
  name           = "${var.unique_id}-vpc"
  resource_group = data.ibm_resource_group.resource_group.id
}

##############################################################################

##############################################################################
# Address prefixes
##############################################################################

resource ibm_is_vpc_address_prefix subnet_prefix {
  count = length(var.cidr_blocks)
  name  = "${var.unique_id}-prefix-zone-${count.index + 1}" 
  zone  = "${var.ibm_region}-${count.index + 1}"
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
  zone  = "${var.ibm_region}-${count.index + 1}"
  ipv4_cidr_block          = element(ibm_is_vpc_address_prefix.subnet_prefix.*.cidr, count.index)
}

##############################################################################

##############################################################################
# Security Group Rules
##############################################################################
#inbound
resource ibm_is_security_group_rule rule1 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "outbound"
      remote    = "10.0.0.0/8"
}

resource ibm_is_security_group_rule rule2 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "outbound"
      remote    = "159.50.0.0/16"
}

resource ibm_is_security_group_rule rule3 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "outbound"
      remote    = "159.95.0.0/16"
}

resource ibm_is_security_group_rule rule4 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "outbound"
      remote    = "22.0.0.0/8"
}

resource ibm_is_security_group_rule rule5 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "outbound"
      remote    = "172.16.0.0/12"
}
# outbound
resource ibm_is_security_group_rule rule6 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "10.0.0.0/8"
}

resource ibm_is_security_group_rule rule7 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "159.50.0.0/16"
}

resource ibm_is_security_group_rule rule8 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "159.95.0.0/16"
}
/*
resource ibm_is_security_group_rule rule9 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "22.0.0.0/8"
}
*/
resource ibm_is_security_group_rule rule10 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "172.16.0.0/12"
}

resource ibm_is_security_group_rule rule11 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "166.9.62.0/23"
}

resource ibm_is_security_group_rule rule12 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "166.9.64.0/23"
}

resource ibm_is_security_group_rule rule13 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "166.9.66.0/23"
}

resource ibm_is_security_group_rule rule14 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "161.26.0.35"
      tcp {
        port_min = 443
        port_max = 443
      }
}

resource ibm_is_security_group_rule rule15 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "161.26.0.10"
      udp {
        port_min = 53
        port_max = 53
      }
}

resource ibm_is_security_group_rule rule16 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "161.26.0.11"
      udp {
        port_min = 53
        port_max = 53
      }
}
/*
resource ibm_is_security_group_rule rule17 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "161.26.0.6"
      udp {
        port_min = 123
        port_max = 123
      }
}
*/
resource ibm_is_security_group_rule rule18 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "161.26.0.6"
      tcp {
        port_min = 80
        port_max = 80
      }
}

resource ibm_is_security_group_rule rule19 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "161.26.0.6"
      tcp {
        port_min = 443
        port_max = 443
      }
}

resource ibm_is_security_group_rule rule20 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "166.9.24.16"
      tcp {
        port_min = 443
        port_max = 443
      }
}

resource ibm_is_security_group_rule rule21 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "166.9.22.22"
      tcp {
        port_min = 443
        port_max = 443
      }
}

resource ibm_is_security_group_rule rule22 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "166.9.20.31"
      tcp {
        port_min = 443
        port_max = 443
      }
}

resource ibm_is_security_group_rule rule23 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "166.9.24.16"
      tcp {
        port_min = 4443
        port_max = 4443
      }
}

resource ibm_is_security_group_rule rule24 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "166.9.22.22"
      tcp {
        port_min = 4443
        port_max = 4443
      }
}

resource ibm_is_security_group_rule rule25 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "166.9.20.31"
      tcp {
        port_min = 4443
        port_max = 4443
      }
}
/*
resource ibm_is_security_group_rule rule26 {
      group     = ibm_is_vpc.vpc.default_security_group
      direction = "inbound"
      remote    = "0.0.0.0/0"
      icmp {
        type = 8
        code = 0
      }
}
*/
##############################################################################