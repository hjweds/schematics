data "ibm_resource_instance" "resource_instance" {
  name = "hj-appid"
}

resource "ibm_resource_key" "resourceKey" {
  name                 = "mykey"
  role                 = "Writer"
  resource_instance_id = data.ibm_resource_instance.resource_instance.id
}

output tenant_id {
  value       = ibm_resource_key.resourceKey.credentials.tenantId
}

resource ibm_container_bind_service bind_service" {
  cluster_name_id             = "hjw-biv"
  service_instance_name       = "hj-appid"
  namespace_id                = "default"
}