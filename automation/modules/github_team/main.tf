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
      # lower is needed because of bug https://github.com/integrations/terraform-provider-github/issues/3533
      # The bug is already fixed, so once an update to v6.13.0 is released we should be able to remove it again
      username = lower(members.key)
      role     = members.value
    }
  }
}

resource "github_organization_role_team" "role" {
  for_each = var.org_roles

  role_id   = each.value
  team_slug = github_team.team.slug
}
