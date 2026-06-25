resource "github_organization_ruleset" "default_branch" {
  name        = "default-branch"
  target      = "branch"
  enforcement = "evaluate"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }

    repository_property {
      include {
        name            = "visibility"
        property_values = ["public"]
        source          = "system"
      }
    }
  }

  rules {
    deletion         = true
    non_fast_forward = true

    required_linear_history = true
    required_signatures     = true

    pull_request {
      required_approving_review_count = 1
      allowed_merge_methods           = ["squash"]

      # Recommended practices
      dismiss_stale_reviews_on_push     = true
      require_code_owner_review         = false # should be set to true once all repos have CODEOWNERS
      require_last_push_approval        = true
      required_review_thread_resolution = true
    }
  }
}

resource "github_organization_ruleset" "dco" {
  name        = "dco"
  target      = "branch"
  enforcement = "evaluate"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }

    repository_property {
      include {
        name            = "visibility"
        property_values = ["public"]
        source          = "system"
      }
    }
  }

  rules {
    required_status_checks {
      required_check {
        context        = "DCO"
      }
    }
  }
}
