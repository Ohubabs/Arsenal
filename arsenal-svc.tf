resource "kubernetes_service_v1" "arsenal-svc" {
  metadata {
    name = "arsenal-svc"
  }
  spec {
    selector = {
      app = "arsenal"
    }
    port {
      port        = 443
      target_port = 443
    }

    type = "NodePort"
  }
}
