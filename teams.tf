data "github_organization_teams" "org" {}

resource "github_team" "team" {
  for_each    = var.teams
  name        = each.key
  description = coalesce(each.value.description, each.key)
  privacy     = coalesce(each.value.privacy, "secret")

  parent_team_id = each.value.parent_team_id
}

resource "github_team_members" "team" {
  for_each  = var.teams
  team_slug = github_team.team[each.key].slug

  dynamic "members" {
    for_each = toset(coalesce(each.value.members, []))
    content {
      username = members.key
      role     = "member"
    }
  }

  dynamic "members" {
    for_each = toset(coalesce(each.value.maintainers, []))
    content {
      username = members.key
      role     = "maintainer"
    }
  }
}

# Renamed from "admins" in v1.0.11 with the same for_each keys. Without this,
# consumers upgrading from <= v1.0.10 would destroy and recreate every team's
# membership, and the destroy strips each team's members.
moved {
  from = github_team_members.admins
  to   = github_team_members.team
}
