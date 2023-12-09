resource "kubernetes_service_v1" "arsenal-svc" {
  metadata {
    name = "arsenal-svc"
    #annotations = [
                    "service.beta.kubernetes.io/aws-load-balancer-type" = "external" #To use a AWS NLB instead of CLB
                    "service.beta.kubernetes.io/aws-load-balancer-nlb-target-type" = "ip"
                    "service.beta.kubernetes.io/aws-load-balancer-scheme" =  internet-facing
                    "service.beta.kubernetes.io/aws-load-balancer-name" = arsenal-nlb
                  ]
  }
  spec {
    selector = {
      app = "arsenal"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
