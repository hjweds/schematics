data "ibm_resource_instance" "resource_instance" {
  name = "hj-appid"
}

resource "ibm_resource_key" "resourceKey" {
  name                 = "mykey"
  role                 = "Writer"
  resource_instance_id = data.ibm_resource_instance.resource_instance.id
}