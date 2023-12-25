output "repository_urls" {
  value = { for repo_key, repo in aws_ecr_repository.repository : repo_key => repo.repository_url }
}