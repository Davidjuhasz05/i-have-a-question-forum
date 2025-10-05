data "terraform_remote_state" "cluster" {
  backend = "s3"
  config = {
    bucket         = "ihaq-state-bucket"
    key            = "i-have-a-question/terraform.tfstate"
    region         = "eu-central-1"
  }
}

resource "kubernetes_manifest" "namespace" {
  manifest = yamldecode(file("${path.module}/yaml/namespace.yaml"))
}

resource "kubernetes_manifest" "backend_secret" {
  manifest = {
    apiVersion = "v1"
    kind       = "Secret"
    metadata = {
      name      = "backend-secrets"
      namespace = "app"
    }
    type = "Opaque"
    data = {
      DATABASE_URL         = base64encode(data.terraform_remote_state.cluster.outputs.db_connection_url)
      DATABASE_USERNAME    = base64encode(data.terraform_remote_state.cluster.outputs.db_username)
      DATABASE_PASSWORD    = base64encode(data.terraform_remote_state.cluster.outputs.db_password)
    }
  }
  depends_on = [
    kubernetes_manifest.namespace
  ]
}

resource "kubernetes_manifest" "db_init_secret" {
  manifest = {
    apiVersion = "v1"
    kind       = "Secret"
    metadata = {
      name      = "db-init-secrets"
      namespace = "app"
    }
    type = "Opaque"
    data = {
      DB_HOST        = base64encode(data.terraform_remote_state.cluster.outputs.db_host_address)
      DB_PORT        = base64encode(data.terraform_remote_state.cluster.outputs.db_port)
      DB_USER        = base64encode(data.terraform_remote_state.cluster.outputs.db_username)
      DB_PASSWORD    = base64encode(data.terraform_remote_state.cluster.outputs.db_password)
      DB_NAME        = base64encode(data.terraform_remote_state.cluster.outputs.db_name)
    }
  }
  depends_on = [
    kubernetes_manifest.namespace
  ]
}

resource "kubernetes_config_map" "startup_sql" {
  metadata {
    name      = "startup-sql"
    namespace = "app"
  }

  data = {
    "startup.sql" = file("${path.module}/../../../../backend/database_management/startup.sql")
  }
  depends_on = [
    kubernetes_manifest.namespace
  ]
}

resource "kubernetes_manifest" "rds_init_job" {
  manifest = yamldecode(file("${path.module}/yaml/rds_init_job.yaml"))
  depends_on = [
  kubernetes_config_map.startup_sql,
  kubernetes_manifest.namespace,
  kubernetes_manifest.db_init_secret]
}

resource "kubernetes_manifest" "backend_deployment" {
  manifest = yamldecode(file("${path.module}/yaml/backend_deployment.yaml"))
  depends_on = [
    kubernetes_manifest.namespace,
    kubernetes_manifest.backend_secret
  ]
}

resource "kubernetes_manifest" "backend_service" {
  manifest = yamldecode(file("${path.module}/yaml/backend_service.yaml"))
  depends_on = [
    kubernetes_manifest.namespace
  ]
}

resource "kubernetes_manifest" "frontend_deployment" {
  manifest = yamldecode(file("${path.module}/yaml/frontend_deployment.yaml"))
  depends_on = [
    kubernetes_manifest.namespace
  ]
}

resource "kubernetes_manifest" "frontend_service" {
  manifest = yamldecode(file("${path.module}/yaml/frontend_service.yaml"))
  depends_on = [
    kubernetes_manifest.namespace
  ]
}

resource "kubernetes_manifest" "app_ingress" {
  manifest   = yamldecode(file("${path.module}/yaml/ingress.yaml"))
  depends_on = [
    kubernetes_manifest.namespace,
    kubernetes_manifest.backend_service,
    kubernetes_manifest.frontend_service
  ]
}