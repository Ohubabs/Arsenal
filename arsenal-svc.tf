resource "kubernetes_service_v1" "arsenal-svc" {
  metadata {
    name = "arsenal-svc"
  }
  spec {
    selector = {
      app = "arsenal"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
