##NGINX

#resource "kubernetes_ingress_v1" "arsenal-ingress" {
#  wait_for_load_balancer = true
#  metadata {
#    name = "arsenal"
#    namespace = "default"
#    annotations = {
#        "cert-manager.io/cluster-issuer" = "arsenal-issuer1"
#  }
#  }
#  spec {
#    ingress_class_name = "nginx"
#    tls {
#      secret_name = "arsenal-secret"
#      hosts = ["arsenal.devopsnetwork.net"] 
#    }
#    rule {
#      host = "arsenal.devopsnetwork.net"  
#      http {
#        path {
#          path = "/"
#          backend {
#            service {
#              name = "arsenal-svc"
#              port {
#                number = 80
#              }
#            }
#          }
#        }
#      }
#    }
#  }
#}

##ALB

resource "kubernetes_ingress_v1" "jenkins1" {
  wait_for_load_balancer = true
  metadata {
    name = "arsenal"
    namespace = "default"
    annotations = {
        "alb.ingress.kubernetes.io/load-balancer-name" = "arsenal"
        "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
        "alb.ingress.kubernetes.io/target-type"        = "ip"                                       
        "alb.ingress.kubernetes.io/certificate-arn" = "arn:aws:acm:us-west-2:083772204804:certificate/f8707613-028b-470b-bd2a-703f5ac1e73d"
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
      host = "arsenal.devopsnetwork.net"  
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
