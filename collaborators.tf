# Flatten the repository-collaborator associations into a map
locals {
  repository_collaborators = merge([
    for repo_name, repo_config in var.repositories : {
      for username, permission in coalesce(repo_config.collaborators, {}) :
      "${repo_name}:${username}" => {
        repository = repo_name
        username   = username
        permission = permission
      }
    }
  ]...)
}

# Add collaborators to repositories
resource "github_repository_collaborator" "collaborator" {
  for_each   = local.repository_collaborators
  repository = github_repository.repo[each.value.repository].name
  username   = each.value.username
  permission = each.value.permission
}

# List the organization's outside collaborators (first 100 only; the data
# source does not paginate)
data "github_rest_api" "outside_collaborators" {
  endpoint = "orgs/${var.organization}/outside_collaborators?per_page=100"
}
