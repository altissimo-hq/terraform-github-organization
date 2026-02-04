# Flatten the repository-team associations into a map
locals {
  team_repositories = merge([
    for repo_name, repo_config in var.repositories : {
      for team_name, permission in coalesce(repo_config.teams, {}) :
      "${repo_name}:${team_name}" => {
        repository = repo_name
        team_name  = team_name
        permission = permission
      }
    }
  ]...)
}

# Create team-repository associations
resource "github_team_repository" "team_repo" {
  for_each   = local.team_repositories
  team_id    = github_team.team[each.value.team_name].id
  repository = github_repository.repo[each.value.repository].name
  permission = each.value.permission
}
