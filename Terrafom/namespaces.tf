#
# Create Namespaces for Development and production environments
#
resource "kubernetes_namespace" "dev" {
    metadata {
      name = "dev"
    }
}

resource "kubernetes_namespace" "pro" {
    metadata {
      name = "pro"
    }
}