data "github_organization" "org" {
  name = var.organization
}

resource "github_organization_settings" "org" {
  count            = var.settings == null ? 0 : 1
  billing_email    = var.settings.billing_email
  company          = var.settings.company
  blog             = var.settings.blog
  email            = var.settings.email
  twitter_username = var.settings.twitter_username
  location         = var.settings.location
  name             = var.settings.name
  description      = var.settings.description

  has_organization_projects = coalesce(var.settings.has_organization_projects, true)
  has_repository_projects   = coalesce(var.settings.has_repository_projects, true)

  default_repository_permission            = coalesce(var.settings.default_repository_permission, "read")
  members_can_create_internal_repositories = coalesce(var.settings.members_can_create_internal_repositories, false)
  members_can_create_pages                 = coalesce(var.settings.members_can_create_pages, true)
  members_can_create_private_pages         = coalesce(var.settings.members_can_create_private_pages, true)
  members_can_create_private_repositories  = coalesce(var.settings.members_can_create_private_repositories, true)
  members_can_create_public_pages          = coalesce(var.settings.members_can_create_public_pages, true)
  members_can_create_public_repositories   = coalesce(var.settings.members_can_create_public_repositories, true)
  members_can_create_repositories          = coalesce(var.settings.members_can_create_repositories, true)
  members_can_fork_private_repositories    = coalesce(var.settings.members_can_fork_private_repositories, false)
  web_commit_signoff_required              = coalesce(var.settings.web_commit_signoff_required, false)

  advanced_security_enabled_for_new_repositories               = coalesce(var.settings.advanced_security_enabled_for_new_repositories, false)
  dependabot_alerts_enabled_for_new_repositories               = coalesce(var.settings.dependabot_alerts_enabled_for_new_repositories, false)
  dependabot_security_updates_enabled_for_new_repositories     = coalesce(var.settings.dependabot_security_updates_enabled_for_new_repositories, false)
  dependency_graph_enabled_for_new_repositories                = coalesce(var.settings.dependency_graph_enabled_for_new_repositories, false)
  secret_scanning_enabled_for_new_repositories                 = coalesce(var.settings.secret_scanning_enabled_for_new_repositories, false)
  secret_scanning_push_protection_enabled_for_new_repositories = coalesce(var.settings.secret_scanning_push_protection_enabled_for_new_repositories, false)

}
