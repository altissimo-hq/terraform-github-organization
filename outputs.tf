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
  value = {
    id                                                           = data.github_organization.org.id
    node_id                                                      = data.github_organization.org.node_id
    name                                                         = data.github_organization.org.name
    orgname                                                      = data.github_organization.org.orgname
    login                                                        = data.github_organization.org.login
    description                                                  = data.github_organization.org.description
    plan                                                         = data.github_organization.org.plan
    repositories                                                 = data.github_organization.org.repositories
    users                                                        = data.github_organization.org.users
    default_repository_permission                                = data.github_organization.org.default_repository_permission
    members_can_create_repositories                              = data.github_organization.org.members_can_create_repositories
    members_allowed_repository_creation_type                     = data.github_organization.org.members_allowed_repository_creation_type
    members_can_create_public_repositories                       = data.github_organization.org.members_can_create_public_repositories
    members_can_create_private_repositories                      = data.github_organization.org.members_can_create_private_repositories
    members_can_create_internal_repositories                     = data.github_organization.org.members_can_create_internal_repositories
    members_can_create_pages                                     = data.github_organization.org.members_can_create_pages
    members_can_create_public_pages                              = data.github_organization.org.members_can_create_public_pages
    members_can_create_private_pages                             = data.github_organization.org.members_can_create_private_pages
    members_can_fork_private_repositories                        = data.github_organization.org.members_can_fork_private_repositories
    two_factor_requirement_enabled                               = data.github_organization.org.two_factor_requirement_enabled
    web_commit_signoff_required                                  = data.github_organization.org.web_commit_signoff_required
    advanced_security_enabled_for_new_repositories               = data.github_organization.org.advanced_security_enabled_for_new_repositories
    dependabot_alerts_enabled_for_new_repositories               = data.github_organization.org.dependabot_alerts_enabled_for_new_repositories
    dependabot_security_updates_enabled_for_new_repositories     = data.github_organization.org.dependabot_security_updates_enabled_for_new_repositories
    dependency_graph_enabled_for_new_repositories                = data.github_organization.org.dependency_graph_enabled_for_new_repositories
    secret_scanning_enabled_for_new_repositories                 = data.github_organization.org.secret_scanning_enabled_for_new_repositories
    secret_scanning_push_protection_enabled_for_new_repositories = data.github_organization.org.secret_scanning_push_protection_enabled_for_new_repositories
  }
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
