output "description" {
  description = "GitHub Organization Description"
  value       = data.github_organization.org.description
}

output "id" {
  description = "GitHub Organization ID"
  value       = data.github_organization.org.id
}

output "login" {
  description = "GitHub Organization Login"
  value       = data.github_organization.org.login
}

output "members" {
  description = "GitHub Organization Members"
  value       = local.members
}

output "name" {
  description = "GitHub Organization Name"
  value       = data.github_organization.org.name
}

output "organization" {
  description = "GitHub Organization Resource"
  value       = data.github_organization.org
}

output "organization_teams" {
  description = "GitHub Organization Team Resource"
  value       = data.github_organization_teams.org
}

output "plan" {
  description = "GitHub Organization Plan"
  value       = data.github_organization.org.plan
}

output "private_repositories" {
  description = "GitHub Organization Private Repositories"
  value       = local.private_repositories
}

output "public_repositories" {
  description = "GitHub Organization Public Repositories"
  value       = local.public_repositories
}

output "repositories" {
  description = "GitHub Organization Repositories"
  value       = local.repositories
}

output "repository_resources" {
  description = "GitHub Organization Repository Resources"
  value       = data.github_repository.repo
}

output "teams" {
  description = "GitHub Organization Teams"
  value       = local.teams
}

output "team_resources" {
  description = "GitHub Organization Team Resources"
  value       = data.github_organization_teams.org
}

output "unmanaged_members" {
  description = "GitHub Organization Unmanaged Members"
  value       = sort(setsubtract(local.members, concat(var.admins, var.members)))
}

output "unmanaged_repositories" {
  description = "GitHub Organization Unmanaged Repositories"
  value       = sort(setsubtract(local.repositories, keys(var.repositories)))
}

output "unmanaged_teams" {
  description = "GitHub Organization Unmanaged Teams"
  value       = sort(setsubtract(local.teams, keys(var.teams)))
}
