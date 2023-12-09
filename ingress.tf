resource "kubernetes_ingress_v1" "arsenal" {
  wait_for_load_balancer = true
  metadata {
    name = "arsenal"
    namespace = "default"
    annotations = {
        "alb.ingress.kubernetes.io/load-balancer-name" = "arsenal"
        "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
        "alb.ingress.kubernetes.io/target-type"        = "ip" 
        "alb.ingress.kubernetes.io/certificate-arn" = "arn:aws:acm:us-west-2:083772204804:certificate/e773e406-a77d-4557-aeb2-f126b91cf6b6"
  }
  }
  spec {
    ingress_class_name = "alb"
    default_backend {
      service {
        name = "arsenal-svc"
        port {
          number = 80
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
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
