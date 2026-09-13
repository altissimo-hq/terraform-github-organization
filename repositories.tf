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

  has_downloads = coalesce(each.value.has_downloads, true) # deprecated
  has_issues    = coalesce(each.value.has_issues, true)
  has_projects  = coalesce(each.value.has_projects, true)
  has_wiki      = coalesce(each.value.has_wiki, false)

  gitignore_template = each.value.gitignore_template
  license_template   = each.value.license_template

  vulnerability_alerts = coalesce(each.value.vulnerability_alerts, true)
  allow_auto_merge     = coalesce(each.value.allow_auto_merge, false)

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
}
