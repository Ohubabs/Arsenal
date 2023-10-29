resource "kubernetes_deployment_v1" "arsenal-deploy" {
  metadata {
    name = "arsenal"
  }

  spec {
    replicas = 2
    strategy {
        type = "RollingUpdate"
        rolling_update {
            max_surge = 1
            max_unavailable = 1
        }
      }
    min_ready_seconds = 30
    selector {
      match_labels = {
        app = "arsenal"
      }
    }

    template {
      metadata {
        labels = {
          app = "arsenal"
        }
      }

      spec {
        container {
          image = "princebabs/arsenal:v1"
          name  = "arsenal-pod"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = ".5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}