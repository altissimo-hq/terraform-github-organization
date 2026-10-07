data "github_repository" "repo" {
  for_each = toset(local.repositories)
  name     = each.key
}

data "github_repositories" "org" {
  query           = "org:${var.organization}"
  include_repo_id = true
}

resource "github_repository" "repo" {
  for_each = var.repositories
  name     = each.key

  description  = coalesce(each.value.description, each.key)
  homepage_url = each.value.homepage_url
  visibility   = coalesce(each.value.visibility, "private")

  has_issues   = coalesce(each.value.has_issues, true)
  has_projects = coalesce(each.value.has_projects, true)
  has_wiki     = coalesce(each.value.has_wiki, false)

  gitignore_template = each.value.gitignore_template
  license_template   = each.value.license_template

  allow_auto_merge = coalesce(each.value.allow_auto_merge, false)

  allow_merge_commit          = coalesce(each.value.allow_merge_commit, true)
  allow_rebase_merge          = coalesce(each.value.allow_rebase_merge, true)
  allow_squash_merge          = coalesce(each.value.allow_squash_merge, true)
  squash_merge_commit_title   = coalesce(each.value.squash_merge_commit_title, "PR_TITLE")
  squash_merge_commit_message = coalesce(each.value.squash_merge_commit_message, "PR_BODY")

  dynamic "pages" {
    for_each = coalesce(each.value.pages, false) ? toset([1]) : toset([])
    content {
      cname = try(each.value.pages_cname, "")
      source {
        branch = "main"
        path   = coalesce(each.value.pages_path, "/docs")
      }
    }
  }

  topics = coalesce(each.value.topics, [])

  lifecycle {
    # GitHub retired the Downloads feature and ignores writes to has_downloads, so
    # managing it produces a perpetual diff. The provider still reads it back from
    # the API, so it must be ignored rather than merely left unset. Remove this
    # once the provider drops the attribute.
    ignore_changes = [has_downloads]
  }
}

# vulnerability_alerts on github_repository is deprecated since provider 6.12 in
# favour of this resource. The attribute is computed, so dropping it from the
# resource above causes no diff; this resource takes over the setting.
resource "github_repository_vulnerability_alerts" "repo" {
  for_each   = var.repositories
  repository = github_repository.repo[each.key].name
  enabled    = coalesce(each.value.vulnerability_alerts, true)
}
