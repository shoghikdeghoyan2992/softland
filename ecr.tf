module "ecr" {
  source           = "./modules/ecr"
  repository_names = var.ecr_repository_names
}
