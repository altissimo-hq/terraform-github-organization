variable "admins" {
  description = "Map of GitHub Organization Admins"
  type        = list(string)
  default     = []
}

variable "members" {
  description = "Map of GitHub Organization Members"
  type        = list(string)
  default     = []
}

variable "organization" {
  description = "GitHub Organization Name"
  type        = string
}

variable "repositories" {
  description = "Map of GitHub Repos to Create"
  type = map(object({
    description          = optional(string)
    homepage_url         = optional(string)
    visibility           = optional(string)
    has_downloads        = optional(bool) # deprecated
    has_issues           = optional(bool)
    has_projects         = optional(bool)
    has_wiki             = optional(bool)
    gitignore_template   = optional(string)
    license_template     = optional(string)
    vulnerability_alerts = optional(bool)
    pages                = optional(bool)
    pages_cname          = optional(string)
    pages_path           = optional(string)
    topics               = optional(list(string))
  }))
  default = {}
}

variable "settings" {
  description = "Map of GitHub Organization Settings"
  type = object({
    billing_email    = optional(string)
    blog             = optional(string)
    company          = optional(string)
    description      = optional(string)
    email            = optional(string)
    location         = optional(string)
    name             = optional(string)
    twitter_username = optional(string)

    has_organization_projects = optional(bool)
    has_repository_projects   = optional(bool)

    default_repository_permission            = optional(string)
    members_can_create_internal_repositories = optional(bool)
    members_can_create_pages                 = optional(bool)
    members_can_create_private_pages         = optional(bool)
    members_can_create_private_repositories  = optional(bool)
    members_can_create_public_pages          = optional(bool)
    members_can_create_public_repositories   = optional(bool)
    members_can_create_repositories          = optional(bool)
    members_can_fork_private_repositories    = optional(bool)
    web_commit_signoff_required              = optional(bool)

    advanced_security_enabled_for_new_repositories               = optional(bool)
    dependabot_alerts_enabled_for_new_repositories               = optional(bool)
    dependabot_security_updates_enabled_for_new_repositories     = optional(bool)
    dependency_graph_enabled_for_new_repositories                = optional(bool)
    secret_scanning_enabled_for_new_repositories                 = optional(bool)
    secret_scanning_push_protection_enabled_for_new_repositories = optional(bool)

  })
  default = null
}

variable "teams" {
  description = "Map of GitHub Teams to Create"
  type = map(object({
    description    = optional(string)
    privacy        = optional(string)
    parent_team_id = optional(string)

    create_default_maintainer = optional(bool)

    maintainers = optional(list(string))
    members     = optional(list(string))
  }))
  default = {}
}

variable "token" {
  description = "GitHub Personal Access Token"
  type        = string
}
