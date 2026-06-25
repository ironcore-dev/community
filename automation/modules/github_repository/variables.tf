variable "name" {
  description = "The name of the repository"
  type        = string
}

variable "description" {
  description = "A description of the repository"
  type        = string
  default     = null
}

variable "homepage_url" {
  description = "URL of a page describing the repository"
  type        = string
  default     = null
}

variable "topics" {
  description = "A list of topics for the repository"
  type        = list(string)
  default     = null
}

variable "pages_enabled" {
  description = "Whether to enable GitHub Pages for the repository"
  type        = bool
  default     = false
  nullable    = false
}

variable "visibility" {
  description = "The visibility of the repository (public or private)"
  type        = string
  default     = "private"
  nullable    = false

  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "Visibility must be either 'public' or 'private'."
  }
}

variable "default_branch" {
  description = "The default branch of the repository"
  type        = string
  default     = "main"
  nullable    = false
}

variable "collaborator_teams" {
  description = "List of teams with access to the repository, each with a team name and permission level"
  type = list(object({
    name       = string
    permission = string
  }))
  default  = []
  nullable = false

  validation {
    condition     = alltrue([for team in var.collaborator_teams : contains(["pull", "triage", "push", "maintain", "admin"], team.permission)])
    error_message = "Each team permission must be one of: 'pull', 'triage', 'push', 'maintain', or 'admin'."
  }
}
