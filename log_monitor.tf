resource "ibm_resource_instance" "logdna_instance" {
  name                = "${var.unique_id}-logdna"
  location            = var.ibm_region
  service             = "logdna"
  plan                = "7-day"
  resource_group_id   = data.ibm_resource_group.resource_group.id
  parameters = {
    service-endpoints = var.end_points
  }
}

resource "ibm_resource_instance" "monitoringSysdig_instance" {
  name                = "${var.unique_id}-sysdig"
  location            = var.ibm_region
  service             = "sysdig-monitor"
  plan                = "graduated-tier"
  resource_group_id   = data.ibm_resource_group.resource_group.id
  parameters = {
    service-endpoints = var.end_points
  }
}
/*
resource "ibm_resource_instance" "es_instance" {
  name              = "${var.unique_id}-eventstreams"
  service           = "messagehub"
  plan              = "enterprise-3nodes-2tb"
  location          = var.ibm_region
  resource_group_id   = data.ibm_resource_group.resource_group.id
  parameters = {
    service-endpoints = var.end_points
  }
}
*/