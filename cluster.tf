##############################################################################
# Create IKS on VPC Cluster
##############################################################################

resource ibm_container_vpc_cluster cluster {
  name              = "${var.unique_id}-cluster"
  vpc_id            = ibm_is_vpc.vpc.id
  resource_group_id = data.ibm_resource_group.resource_group.id
  flavor            = var.machine_type
  wait_till         = "IngressReady"

  dynamic zones {
    for_each = ibm_is_subnet.subnet
    content {
      subnet_id = zones.value.id
      name      = zones.value.zone
    }
  }
}
