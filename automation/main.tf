
locals {
  teams        = yamldecode(file("${path.module}/../teams.yaml"))
  repositories = yamldecode(file("${path.module}/../repositories.yaml"))

  org_user_map = { for user in data.github_organization.org.users : user.login => user }
  org_role_map = { for role in data.github_organization_roles.all.roles : role.name => role }

  # Teams with org_roles are managed outside of repository collaborators and must be ignored
  ignored_teams = [for team in local.teams : team.name if length(try(team.org_roles, [])) > 0]

  # List of app slugs used by required_status_checks in repositories. Used to fetch app IDs.
  app_slugs = toset(concat(
    ["dco"], # The dco slug is needed for the 'require_signatures' org-wide ruleset
    flatten([for repo in local.repositories : keys(try(repo.required_status_checks, {}))]),
  ))
}

data "github_organization" "org" {
  name = var.github_owner
}

data "github_organization_roles" "all" {}

data "github_app" "apps" {
  for_each = local.app_slugs
  slug     = each.key
}

module "teams" {
  source   = "./modules/github_team"
  for_each = { for team in local.teams : team.name => team }

  name        = each.value.name
  description = each.value.description
  members = [for member in each.value.members : {
    username = member
    role     = local.org_user_map[member].role == "ADMIN" ? "maintainer" : "member"
  }]
  org_roles = { for r in try(each.value.org_roles, []) : r => local.org_role_map[r].role_id }
}

module "repositories" {
  source   = "./modules/github_repository"
  for_each = { for repo in local.repositories : repo.name => repo }

  name = each.value.name

  collaborator_teams = try(each.value.collaborators.teams, null)

  ignored_teams = local.ignored_teams

  # If repos have required status checks, build a ruleset for them.
  rulesets = length(try(each.value.required_status_checks, {})) == 0 ? [] : [
    {
      name        = "Required status checks"
      target      = "branch"
      enforcement = "active"
      conditions = {
        ref_name = {
          include = ["~DEFAULT_BRANCH", "refs/heads/release-*"]
          exclude = []
        }
      }
      rules = {
        required_status_checks = {
          do_not_enforce_on_create = true

          required_check = flatten([
            for app_slug, contexts in each.value.required_status_checks : [
              for context in contexts : {
                context        = context
                integration_id = data.github_app.apps[app_slug].id
              }
            ]
          ])
        }
      }
    }
  ]
}
