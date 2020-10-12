##############################################################################
# Create a Certificate Manager instance
##############################################################################
/*
resource ibm_resource_instance cms_instance {
  name              = "${var.unique_id}-cms"
  service           = "cloudcerts"
  plan              = "free"
  location          = var.ibm_region
  resource_group_id = data.ibm_resource_group.resource_group.id

  parameters = {
    service-endpoints = var.cms_end_points
  }
}

################################################################################
# Import certificate to Certificate Manager
################################################################################

resource ibm_certificate_manager_import cert {
    certificate_manager_instance_id = ibm_resource_instance.cms_instance.id
    name        = var.certificate_name
    data        = {
      content   = var.cert_pem
      priv_key  = var.private_key

      # Or read from files
      # content      = file("${path.module}/cert.pem")
      # priv_key     = file("${path.module}/private.key")
    }
  
}

################################################################################
# Bind certificate from certificate manager to kubernetes cluster
################################################################################

resource ibm_container_alb_cert alb_cert {
  cert_crn    = ibm_certificate_manager_import.cert.id
  secret_name = var.certificate_name
  cluster_id  = ibm_container_vpc_cluster.cluster.id
}
*/
##############################################################################