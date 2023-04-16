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
