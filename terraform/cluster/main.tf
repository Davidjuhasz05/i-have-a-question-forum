module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  region = var.region
}

module "eks" {
  source = "./modules/eks"

  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet1_id

  project_name = var.project_name
  aws_region = var.region
  configure_kubectl = true

  depends_on = [module.vpc]
}

module "rds" {
  source = "./modules/rds"

  vpc_id = module.vpc.vpc_id
  private_subnet1_id = module.vpc.private_subnet1_id
  private_subnet2_id = module.vpc.private_subnet2_id
  private_subnet1_cidr = module.vpc.private_subnet1_cidr_block
  project_name = var.project_name

  depends_on = [module.eks]
}