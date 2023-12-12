#resource "kubernetes_secret_v1" "aws-auth" {
#  metadata {
#    name = "konoha"
#    namespace = "cert-manager"
#  }
#
#  data = {
#    access-key-id = "xxx"
#    secret-access-key = "xxx"
#  }
#
#  type = "Opaque"
#}

#resource "kubernetes_namespace_v1" "certmanager-namespace" {
#  metadata {
#    name = "arsenal"
#  }
#}
