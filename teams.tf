data "github_organization_teams" "org" {}

resource "github_team" "team" {
  for_each    = var.teams
  name        = each.key
  description = coalesce(each.value.description, each.key)
  privacy     = coalesce(each.value.privacy, "secret")

  parent_team_id            = each.value.parent_team_id
  create_default_maintainer = coalesce(each.value.create_default_maintainer, false)
}

resource "github_team_members" "admins" {
  for_each = var.teams
  team_id  = github_team.team[each.key].id

  dynamic "members" {
    for_each = toset(each.value.members)
    content {
      username = members.key
      role     = "member"
    }
  }

  dynamic "members" {
    for_each = toset(each.value.maintainers)
    content {
      username = members.key
      role     = "maintainer"
    }
  }
}
