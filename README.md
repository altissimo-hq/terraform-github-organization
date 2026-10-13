<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 6.13 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_github"></a> [github](#provider\_github) | >= 6.13 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [github_branch_default.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_membership.admins](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/membership) | resource |
| [github_membership.members](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/membership) | resource |
| [github_organization_settings.org](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_settings) | resource |
| [github_repository.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_pages.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_pages) | resource |
| [github_repository_vulnerability_alerts.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_vulnerability_alerts) | resource |
| [github_team.team](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team_members.team](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_members) | resource |
| [github_team_repository.team_repo](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_organization.org](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/organization) | data source |
| [github_organization_teams.org](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/organization_teams) | data source |
| [github_repositories.org](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repositories) | data source |
| [github_repository.repo](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_admins"></a> [admins](#input\_admins) | Map of GitHub Organization Admins | `list(string)` | `[]` | no |
| <a name="input_members"></a> [members](#input\_members) | Map of GitHub Organization Members | `list(string)` | `[]` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | GitHub Organization Name | `string` | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | Map of GitHub Repos to Create | <pre>map(object({<br/>    description          = optional(string)<br/>    default_branch       = optional(string) # unmanaged when unset; the branch must already exist<br/>    homepage_url         = optional(string)<br/>    visibility           = optional(string)<br/>    has_issues           = optional(bool)<br/>    has_projects         = optional(bool)<br/>    has_wiki             = optional(bool)<br/>    gitignore_template   = optional(string)<br/>    license_template     = optional(string)<br/>    vulnerability_alerts = optional(bool)<br/><br/>    allow_auto_merge            = optional(bool)<br/>    allow_merge_commit          = optional(bool)<br/>    allow_rebase_merge          = optional(bool)<br/>    allow_squash_merge          = optional(bool)<br/>    delete_branch_on_merge      = optional(bool)<br/>    squash_merge_commit_title   = optional(string)<br/>    squash_merge_commit_message = optional(string)<br/>    pages                       = optional(bool)<br/>    pages_cname                 = optional(string)<br/>    pages_path                  = optional(string)<br/>    topics                      = optional(list(string))<br/>    teams                       = optional(map(string)) # team name -> permission (pull, push, maintain, admin)<br/><br/>    archived           = optional(bool) # GitHub cannot unarchive via the API; this is one-way<br/>    archive_on_destroy = optional(bool) # defaults to true: removing a repo from the map archives it<br/>  }))</pre> | `{}` | no |
| <a name="input_settings"></a> [settings](#input\_settings) | Map of GitHub Organization Settings | <pre>object({<br/>    billing_email    = optional(string)<br/>    blog             = optional(string)<br/>    company          = optional(string)<br/>    description      = optional(string)<br/>    email            = optional(string)<br/>    location         = optional(string)<br/>    name             = optional(string)<br/>    twitter_username = optional(string)<br/><br/>    has_organization_projects = optional(bool)<br/>    has_repository_projects   = optional(bool)<br/><br/>    default_repository_permission            = optional(string)<br/>    members_can_create_internal_repositories = optional(bool)<br/>    members_can_create_pages                 = optional(bool)<br/>    members_can_create_private_pages         = optional(bool)<br/>    members_can_create_private_repositories  = optional(bool)<br/>    members_can_create_public_pages          = optional(bool)<br/>    members_can_create_public_repositories   = optional(bool)<br/>    members_can_create_repositories          = optional(bool)<br/>    members_can_fork_private_repositories    = optional(bool)<br/>    web_commit_signoff_required              = optional(bool)<br/><br/>    advanced_security_enabled_for_new_repositories               = optional(bool)<br/>    dependabot_alerts_enabled_for_new_repositories               = optional(bool)<br/>    dependabot_security_updates_enabled_for_new_repositories     = optional(bool)<br/>    dependency_graph_enabled_for_new_repositories                = optional(bool)<br/>    secret_scanning_enabled_for_new_repositories                 = optional(bool)<br/>    secret_scanning_push_protection_enabled_for_new_repositories = optional(bool)<br/><br/>  })</pre> | `null` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | Map of GitHub Teams to Create | <pre>map(object({<br/>    description    = optional(string)<br/>    privacy        = optional(string)<br/>    parent_team_id = optional(string)<br/><br/>    maintainers = optional(list(string))<br/>    members     = optional(list(string))<br/>  }))</pre> | `{}` | no |
| <a name="input_token"></a> [token](#input\_token) | GitHub Personal Access Token | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_description"></a> [description](#output\_description) | GitHub Organization Description |
| <a name="output_id"></a> [id](#output\_id) | GitHub Organization ID |
| <a name="output_login"></a> [login](#output\_login) | GitHub Organization Login |
| <a name="output_members"></a> [members](#output\_members) | GitHub Organization Members |
| <a name="output_name"></a> [name](#output\_name) | GitHub Organization Name |
| <a name="output_organization"></a> [organization](#output\_organization) | GitHub Organization Resource |
| <a name="output_organization_teams"></a> [organization\_teams](#output\_organization\_teams) | GitHub Organization Team Resource |
| <a name="output_plan"></a> [plan](#output\_plan) | GitHub Organization Plan |
| <a name="output_private_repositories"></a> [private\_repositories](#output\_private\_repositories) | GitHub Organization Private Repositories |
| <a name="output_public_repositories"></a> [public\_repositories](#output\_public\_repositories) | GitHub Organization Public Repositories |
| <a name="output_repositories"></a> [repositories](#output\_repositories) | GitHub Organization Repositories |
| <a name="output_repository_resources"></a> [repository\_resources](#output\_repository\_resources) | GitHub Organization Repository Resources |
| <a name="output_team_resources"></a> [team\_resources](#output\_team\_resources) | GitHub Organization Team Resources |
| <a name="output_teams"></a> [teams](#output\_teams) | GitHub Organization Teams |
| <a name="output_unmanaged_members"></a> [unmanaged\_members](#output\_unmanaged\_members) | GitHub Organization Unmanaged Members |
| <a name="output_unmanaged_repositories"></a> [unmanaged\_repositories](#output\_unmanaged\_repositories) | GitHub Organization Unmanaged Repositories |
| <a name="output_unmanaged_teams"></a> [unmanaged\_teams](#output\_unmanaged\_teams) | GitHub Organization Unmanaged Teams |
<!-- END_TF_DOCS -->

## Default branches

`default_branch` is unmanaged unless set. When it is set, the module manages
the default branch with `github_branch_default`, and the Pages site (if
`pages = true`) is built from that branch instead of `main`. The branch must
already exist; the module never creates or renames branches.

Setting it on an existing repository needs no import. If the live default
branch already matches, the first apply records it without changing anything.
Unsetting it later only stops managing the branch; the repository is left as
it is.

## Upgrading from v1.0.10 or earlier

Upgrade straight to v1.0.21 or later. Several releases since v1.0.10 move
resources around in state, and v1.0.21 is the first that handles all of them.
Work through these steps, then read the plan carefully before applying.

1. **Team memberships (v1.0.11).** `github_team_members.admins` was renamed to
   `github_team_members.team`. v1.0.21 carries a `moved` block for this, so
   there is nothing to do. On an older version, the plan destroys and recreates
   every team's membership; don't apply it.

2. **Archived repositories (v1.0.20).** Set `archived = true` on every
   repository in the map that is already archived on GitHub. If the repository
   was archived outside Terraform and has a vulnerability alerts entry in state
   (v1.0.17 or later only), remove that entry first, because refreshing it fails
   on an archived repository:

   ```sh
   terraform state rm 'module.organization.github_repository_vulnerability_alerts.repo["<repo>"]'
   ```

3. **GitHub Pages (v1.0.18).** Pages moved from an inline block on
   `github_repository` to a separate `github_repository_pages` resource. Import
   it for every repository with `pages = true`, or the create fails because the
   Pages site already exists. Add this to the root module (Terraform 1.7 or
   later for `for_each` on `import`) and remove it after the apply:

   ```hcl
   import {
     for_each = toset(["<repo-with-pages>"])
     to       = module.organization.github_repository_pages.repo[each.key]
     id       = each.key
   }
   ```

4. **Vulnerability alerts (v1.0.17).** These moved to a separate
   `github_repository_vulnerability_alerts` resource. The plan shows one create
   per non-archived repository. That is expected: enabling alerts is
   idempotent, so no import is needed.

5. **Removed inputs.** `has_downloads` (repositories) and
   `create_default_maintainer` (teams) are no longer read. Terraform discards
   them silently, so delete them from your configuration to avoid confusion.

6. **Newly managed merge settings.** `allow_auto_merge`, `allow_merge_commit`,
   `allow_rebase_merge`, `allow_squash_merge`, `delete_branch_on_merge`,
   `squash_merge_commit_title` and `squash_merge_commit_message` are now
   managed, with defaults. Any repository whose current settings differ from
   the defaults shows an update. Set the input explicitly to keep the current
   behaviour.

7. **Archive on destroy (v1.0.20).** Every repository shows an in-place update
   setting `archive_on_destroy = true`. From then on, removing a repository from
   the map archives it instead of deleting it.
