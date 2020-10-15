##############################################################################
# Cluster Data
##############################################################################

data ibm_container_cluster_config cluster {
  cluster_name_id   = "bnpp-dmzr-cluster"
  resource_group_id = data.ibm_resource_group.resource_group.id
  admin             = true
}

##############################################################################


##############################################################################
# Kubernetes Provider
##############################################################################

provider kubernetes {
  load_config_file       = false
  host                   = data.ibm_container_cluster_config.cluster.host
  client_certificate     = data.ibm_container_cluster_config.cluster.admin_certificate
  client_key             = data.ibm_container_cluster_config.cluster.admin_key
  cluster_ca_certificate = data.ibm_container_cluster_config.cluster.ca_certificate
}

##############################################################################