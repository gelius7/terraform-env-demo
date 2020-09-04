# variable

variable "region" {
  description = "생성될 리전을 입력 합니다. e.g: ap-northeast-2"
  default     = "ap-northeast-2"
}

variable "cluster_name" {
  description = "EKS Cluster 이름을 입력합니다. e.g: eks-demo"
  default     = "eks-demo"
}

variable "cluster_role" {
  description = "EKS Cluster 롤을 입력합니다. e.g: dev, alpha, prod, devops"
  default     = "devops"
}

variable "root_domain" {
  default = ""
}

variable "base_domain" {
  default = ""
}

variable "acm_arn" {
  default = ""
}

variable "efs_id" {
  default = ""
}

### service ###

variable "chaoskube_enabled" {
  default = true
}

variable "cert_manager_enabled" {
  default = false
}

variable "weave_scope_enabled" {
  default = false
}

### argo ###

variable "argo_enabled" {
  default = false
}

variable "argo_events_enabled" {
  default = false
}

variable "argo_cd_enabled" {
  default = true
}

variable "argo_cd_apps_enabled" {
  default = false
}

### devops ###

variable "jenkins_enabled" {
  default = false
}

variable "chartmuseum_enabled" {
  default = false
}

variable "registry_enabled" {
  default = false
}

variable "harbor_enabled" {
  default = false
}

variable "archiva_enabled" {
  default = false
}

variable "nexus_enabled" {
  default = false
}

variable "sonarqube_enabled" {
  default = false
}

### gatekeeper ###

variable "kiali_gatekeeper" {
  default = false
}

variable "tracing_gatekeeper" {
  default = false
}

variable "weave_scope_gatekeeper" {
  default = true
}
