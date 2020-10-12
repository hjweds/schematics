##############################################################################
# Account Variables
##############################################################################

variable ibmcloud_api_key {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
  type        = string
}

variable unique_id {
    description = "A unique identifier need to provision resources. Must begin with a letter"
    type        = string
    default     = "hjw-fr2"
}

variable ibm_region {
    description = "IBM Cloud region where all resources will be deployed"
    type        = string
    default     = "eu-fr2"
}

variable resource_group {
    description = "Name of resource group to create VPC"
    type        = string
    default     = "default"
}

variable generation {
  description = "generation for VPC. Can be 1 or 2"
  #type        = number
  default     = 2
}

##############################################################################


##############################################################################
# Network variables
##############################################################################

variable zones {
    description = "Number of zones to deploy subnets in"
    type        = number
    default     = 1
}

variable cidr_blocks {
  description = "A list of tier subnet CIDR blocks"
  type        = list //(string)
  default     = [
    "10.10.10.0/24"
  ] 
}

##############################################################################

##############################################################################
# Cluster Variables
##############################################################################

variable machine_type {
    description = "The flavor of VPC worker node to use for your cluster"
    type        = string
    default     = "cx2.2x4"
}

##############################################################################
# App Variables
##############################################################################

variable app_name {
  description = "Name for app in kubernetes"
  default     = "hello-world"
}

variable namespace {
  description = "Namespace to deploy application"
  default     = "default"
}

variable container_name {
  description = "Name for container in deployment"
  default     = "hello-world"
}

variable app_image {
  description = "link to app image to install"
  default     = "nginx:1.7.9"
}

variable service_port {
  description = "Port for application"
  default     = 80
  
}

variable request_type {
  default     = "web"
  
}

##############################################################################

##############################################################################
# Certificate Manager Variables
##############################################################################

variable cms_end_points {
  description = "service endpoint of certifiate manager"
  default     = "private"
}

variable certificate_name {
  description = "Name of certificate"
  default     = "cms-cert"
}

variable cert_pem {
  description = "certificate value"
  default     = ""
}

variable private_key {
  description = "private key value"
  default     = ""
}