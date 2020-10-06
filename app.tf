##############################################################################
# App Deployment
##############################################################################

resource kubernetes_deployment app_deployment {
  metadata {
    name      = var.app_name
    namespace = var.namespace

    labels = {
      app = var.app_name
    }
  }

  spec {
    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.container_name
          image = var.app_image       
        }
      }
    }
  }
}

##############################################################################
# Nodeport Service
##############################################################################

resource kubernetes_service app_service {
  metadata {
    name      = "${var.app_name}-service"
    namespace = var.namespace

    labels = {
      app = "${var.app_name}-service"
    }
  }

  spec {
    port {
      port     = var.service_port
    }

    selector = {
      app = kubernetes_deployment.app_deployment.metadata.0.name
    }

    type = "NodePort"
  }

  depends_on = [kubernetes_deployment.app_deployment]
}

##############################################################################

##############################################################################
# Ingress Setup
##############################################################################

resource kubernetes_ingress ingress {
  
  metadata {
    name      = "${var.app_name}-ingress"
    namespace = var.namespace

    annotations = {
      "ingress.bluemix.net/redirect-to-https" = true
    }
  }

  spec {
    rule {
      host = "${var.app_name}.${ibm_container_vpc_cluster.cluster.ingress_hostname}"

      http {
        path {
          path = "/"

          backend {
            service_name = kubernetes_service.app_service.metadata.0.name
            service_port = var.service_port
          }
        }
      }
    }

    tls {
      hosts = ["${var.app_name}.${ibm_container_vpc_cluster.cluster.ingress_hostname}"]
      secret_name = ibm_container_vpc_cluster.cluster.ingress_secret
    }
  }

  depends_on = [kubernetes_service.app_service]

}

##############################################################################