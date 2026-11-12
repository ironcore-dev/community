resource "github_team" "team" {
  name                 = var.name
  description          = var.description
  privacy              = var.privacy
  notification_setting = var.notification_setting
}

resource "github_team_members" "members" {
  team_slug = github_team.team.slug

  dynamic "members" {
    for_each = { for member in var.members : member.username => member.role }
    content {
      username = members.key
      role     = members.value
    }
  }
}

resource "github_organization_role_team" "role" {
  for_each = var.org_roles

  role_id   = each.value
  team_slug = github_team.team.slug
}
