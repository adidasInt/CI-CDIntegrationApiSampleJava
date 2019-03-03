#
# Create a role from Tiler and a Role binding as cluster-admin for default
#
resource "kubernetes_cluster_role_binding" "default_binding" {
    metadata {
        name = "default-binding"
    }
    role_ref {
        api_group = "rbac.authorization.k8s.io"
        kind = "ClusterRole"
        name = "cluster-admin"
    }
    subject {
        kind = "User"
        name = "default"
        api_group = "rbac.authorization.k8s.io"
    }
    subject {
        kind = "ServiceAccount"
        name = "default"
        namespace = "kube-system"
    }
    subject {
        kind = "Group"
        name = "system:masters"
        api_group = "rbac.authorization.k8s.io"
    }
}


resource "kubernetes_cluster_role_binding" "tiller" {
  metadata {
    name = "tiller"
  }

  subject {
    kind = "User"
    name = "system:serviceaccount:kube-system:tiller"
  }

  role_ref {
    kind  = "ClusterRole"
    name = "cluster-admin"
  }
} 