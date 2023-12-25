resource "aws_ecr_repository" "repository" {
  for_each = var.repository_names

  name = each.value

  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}
