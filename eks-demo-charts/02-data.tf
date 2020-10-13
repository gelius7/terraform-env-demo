# data

data "aws_caller_identity" "current" {
}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.aws_eks_cluster.cluster.name
}

data "aws_ssm_parameter" "admin_username" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "admin_username")
}

data "aws_ssm_parameter" "admin_password" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "admin_password")
}

data "aws_ssm_parameter" "google_client_id" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "google_client_id")
}

data "aws_ssm_parameter" "google_client_secret" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "google_client_secret")
}

data "aws_ssm_parameter" "github_client_id" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "github_client_id")
}

data "aws_ssm_parameter" "github_client_secret" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "github_client_secret")
}

data "aws_ssm_parameter" "github_user" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "github_user")
}

data "aws_ssm_parameter" "github_token" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "github_token")
}

data "aws_ssm_parameter" "github_secret" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "github_secret")
}

data "aws_ssm_parameter" "datadog_api_key" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "datadog_api_key")
}

data "aws_ssm_parameter" "datadog_app_key" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "datadog_app_key")
}

data "aws_ssm_parameter" "slack_token" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "slack_token")
}

data "aws_ssm_parameter" "logzio_token" {
  name = format("/k8s/%s/%s/%s", var.cluster_role, var.cluster_name, "logzio_token")
}

data "template_file" "jenkins-env" {
  template = file("${path.module}/template/jenkins-env.groovy")
  vars = {
    cluster     = var.cluster_name
    role        = var.cluster_role
    slack_token = local.slack_token
    base_domain = local.domain_public
    jenkins     = local.domain.jenkins
    harbor      = local.domain.harbor
    archiva     = local.domain.archiva
    chartmuseum = local.domain.chartmuseum
    registry    = local.domain.registry
    nexus       = local.domain.nexus
    sonarqube   = local.domain.sonarqube
  }
}

# data "template_file" "keycloak-realm" {
#   template = file("${path.module}/template/keycloak-realm.json")
#   vars = {
#     google_client_id     = local.google_client_id
#     google_client_secret = local.google_client_secret
#   }
# }

# data "template_file" "kube-config" {
#   template = file("${path.module}/template/kube-config.yaml")
#   vars = {
#     cluster_url       = data.aws_eks_cluster.cluster.endpoint
#     cluster_auth_data = data.aws_eks_cluster.cluster.certificate_authority.0.data
#     cluster_token     = data.aws_eks_cluster_auth.cluster.token
#   }
# }
