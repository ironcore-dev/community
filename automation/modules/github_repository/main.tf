# TODO: replace data source with proper resource to manage actual repository
data "github_repository" "repository" {
  name         = var.name
}

resource "github_repository_collaborators" "collaborators" {
  repository = data.github_repository.repository.name

  dynamic "team" {
    for_each = var.collaborator_teams
    content {
      team_id    = team.value.name
      permission = team.value.permission
    }
  }
}
