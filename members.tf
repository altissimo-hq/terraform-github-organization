resource "github_membership" "admins" {
  for_each = toset(var.admins)
  username = each.key
  role     = "admin"
}

resource "github_membership" "members" {
  for_each = toset(var.members)
  username = each.key
  role     = "member"
}
