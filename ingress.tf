resource "kubernetes_ingress_v1" "arsenal" {
  wait_for_load_balancer = true
  metadata {
    name = "arsenal"
    namespace = "default"
    annotations = {
        "alb.ingress.kubernetes.io/load-balancer-name" = "arsenal"
        "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
        "alb.ingress.kubernetes.io/target-type"        = "ip" 
        "alb.ingress.kubernetes.io/certificate-arn" = module.acm.acm_certificate_arn
  }
  }
  spec {
    ingress_class_name = "alb"
    default_backend {
      service {
        name = "arsenal-svc"
        port {
          number = 443
        }
      }
    }
    rule {
      host = "arsenal.skyways-hotel.com"  
      http {
        path {
          path = "/"
          path_type = "Exact"
          backend {
            service {
              name = "arsenal-svc"
              port {
                number = 443
              }
            }
          }
        }
      }
    }
  }
}