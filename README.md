<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | 5.21.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 5.21.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_membership.admins](https://registry.terraform.io/providers/integrations/github/5.21.1/docs/resources/membership) | resource |
| [github_membership.members](https://registry.terraform.io/providers/integrations/github/5.21.1/docs/resources/membership) | resource |
| [github_organization_settings.org](https://registry.terraform.io/providers/integrations/github/5.21.1/docs/resources/organization_settings) | resource |
| [github_repository.repo](https://registry.terraform.io/providers/integrations/github/5.21.1/docs/resources/repository) | resource |
| [github_team.team](https://registry.terraform.io/providers/integrations/github/5.21.1/docs/resources/team) | resource |
| [github_team_members.admins](https://registry.terraform.io/providers/integrations/github/5.21.1/docs/resources/team_members) | resource |
| [github_organization.org](https://registry.terraform.io/providers/integrations/github/5.21.1/docs/data-sources/organization) | data source |
| [github_organization_teams.org](https://registry.terraform.io/providers/integrations/github/5.21.1/docs/data-sources/organization_teams) | data source |
| [github_repository.repo](https://registry.terraform.io/providers/integrations/github/5.21.1/docs/data-sources/repository) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admins"></a> [admins](#input\_admins) | Map of GitHub Organization Admins | `list(string)` | `[]` | no |
| <a name="input_members"></a> [members](#input\_members) | Map of GitHub Organization Members | `list(string)` | `[]` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | GitHub Organization Name | `string` | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | Map of GitHub Repos to Create | <pre>map(object({<br>    cname                = optional(string)<br>    description          = optional(string)<br>    gitignore_template   = optional(string)<br>    has_downloads        = optional(bool)<br>    has_issues           = optional(bool)<br>    has_projects         = optional(bool)<br>    has_wiki             = optional(bool)<br>    homepage_url         = optional(string)<br>    license_template     = optional(string)<br>    pages                = optional(bool)<br>    visibility           = optional(string)<br>    vulnerability_alerts = optional(bool)<br>  }))</pre> | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | Map of GitHub Organization Settings | <pre>object({<br>    billing_email    = optional(string)<br>    blog             = optional(string)<br>    company          = optional(string)<br>    description      = optional(string)<br>    email            = optional(string)<br>    location         = optional(string)<br>    name             = optional(string)<br>    twitter_username = optional(string)<br><br>    has_organization_projects = optional(bool)<br>    has_repository_projects   = optional(bool)<br><br>    default_repository_permission            = optional(string)<br>    members_can_create_internal_repositories = optional(bool)<br>    members_can_create_pages                 = optional(bool)<br>    members_can_create_private_pages         = optional(bool)<br>    members_can_create_private_repositories  = optional(bool)<br>    members_can_create_public_pages          = optional(bool)<br>    members_can_create_public_repositories   = optional(bool)<br>    members_can_create_repositories          = optional(bool)<br>    members_can_fork_private_repositories    = optional(bool)<br>    web_commit_signoff_required              = optional(bool)<br><br>    advanced_security_enabled_for_new_repositories               = optional(bool)<br>    dependabot_alerts_enabled_for_new_repositories               = optional(bool)<br>    dependabot_security_updates_enabled_for_new_repositories     = optional(bool)<br>    dependency_graph_enabled_for_new_repositories                = optional(bool)<br>    secret_scanning_enabled_for_new_repositories                 = optional(bool)<br>    secret_scanning_push_protection_enabled_for_new_repositories = optional(bool)<br><br>  })</pre> | n/a | yes |
| <a name="input_teams"></a> [teams](#input\_teams) | Map of GitHub Teams to Create | <pre>map(object({<br>    description    = optional(string)<br>    privacy        = optional(string)<br>    parent_team_id = optional(string)<br><br>    create_default_maintainer = optional(bool)<br><br>    maintainers = optional(list(string))<br>    members     = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_token"></a> [token](#input\_token) | GitHub Personal Access Token | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_description"></a> [description](#output\_description) | GitHub Organization Description |
| <a name="output_id"></a> [id](#output\_id) | GitHub Organization ID |
| <a name="output_login"></a> [login](#output\_login) | GitHub Organization Login |
| <a name="output_members"></a> [members](#output\_members) | GitHub Organization Members |
| <a name="output_name"></a> [name](#output\_name) | GitHub Organization Name |
| <a name="output_plan"></a> [plan](#output\_plan) | GitHub Organization Plan |
| <a name="output_private_repositories"></a> [private\_repositories](#output\_private\_repositories) | GitHub Organization Private Repositories |
| <a name="output_public_repositories"></a> [public\_repositories](#output\_public\_repositories) | GitHub Organization Public Repositories |
| <a name="output_repositories"></a> [repositories](#output\_repositories) | GitHub Organization Repositories |
| <a name="output_teams"></a> [teams](#output\_teams) | GitHub Organization Teams |
| <a name="output_unmanaged_members"></a> [unmanaged\_members](#output\_unmanaged\_members) | GitHub Organization Unmanaged Members |
| <a name="output_unmanaged_repositories"></a> [unmanaged\_repositories](#output\_unmanaged\_repositories) | GitHub Organization Unmanaged Repositories |
| <a name="output_unmanaged_teams"></a> [unmanaged\_teams](#output\_unmanaged\_teams) | GitHub Organization Unmanaged Teams |
<!-- END_TF_DOCS -->
