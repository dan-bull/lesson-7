resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "infra-tools"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.51.6"

  values = [
    file("${path.module}/values/argocd-values.yaml")
  ]
}