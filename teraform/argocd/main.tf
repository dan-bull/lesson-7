resource "kubernetes_namespace_v1" "infra_tools" {
  metadata {
    name = "infra-tools"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace_v1.infra_tools.metadata[0].name
  version    = "5.46.7"

  values = [
    file("${path.module}/values/argocd-values.yaml")
  ]

  # Важливо: чекати створення namespace
  depends_on = [kubernetes_namespace_v1.infra_tools]
}