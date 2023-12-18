resource "kubernetes_namespace_v1" "arsenal-namespace" {
  metadata {
    name = "arsenal"
  }
}
