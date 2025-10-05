module "nginx_ingress_controller" {
  source = "./modules/nginx-ingress-controller"
}

module "k8s" {
  source = "./modules/k8s"
  depends_on = [module.nginx_ingress_controller]
}