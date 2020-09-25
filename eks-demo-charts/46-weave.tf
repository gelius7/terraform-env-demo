# weave-scope

resource "helm_release" "weave-scope" {
  count = var.weave_scope_enabled ? 1 : 0

  repository = "https://kubernetes-charts.storage.googleapis.com"
  chart      = "weave-scope"
  version    = var.stable_weave_scope

  namespace = "weave"
  name      = "weave-scope"

  values = [
    file("./values/weave/weave-scope.yaml")
  ]

  set {
    name  = "weave-scope-frontend.ingress.enabled"
    value = var.weave_scope_gatekeeper ? false : true
  }

  create_namespace = true
}

resource "helm_release" "weave-scope-gatekeeper" {
  count = var.weave_scope_enabled ? var.weave_scope_gatekeeper ? 1 : 0 : 0

  repository = "https://gabibbo97.github.io/charts/"
  chart      = "keycloak-gatekeeper"
  version    = var.gabibbo97_keycloak_gatekeeper

  namespace = "weave"
  name      = "weave-scope-gatekeeper"

  values = [
    file("./values/weave/weave-scope-gatekeeper.yaml")
  ]

  wait = false

  create_namespace = true

  depends_on = [
    helm_release.keycloak,
  ]
}
