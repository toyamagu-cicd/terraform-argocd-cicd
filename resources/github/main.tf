resource "github_repository" "this" {
  for_each = { for ind, item in var.repositories : ind => item if item.create }

  name        = each.value.name
  description = each.value.description
  auto_init   = each.value.auto_init

  visibility = each.value.visibility
}

data "github_repository" "this" {
  for_each = { for ind, item in var.repositories : item.name => item if item.create }
  name     = each.value.name
  depends_on = [
    github_repository.this
  ]
}

resource "github_team" "this" {
  for_each = { for ind, item in var.teams : item.name => item }

  name        = each.value.name
  description = each.value.description

  privacy = each.value.privacy
}

resource "github_branch" "this" {
  for_each   = { for ind, item in local.branches : ind => item }
  repository = each.value.repo
  branch     = each.value.branch

  depends_on = [
    github_repository.this
  ]
}

resource "github_branch_protection_v3" "this" {
  for_each = { for _, item in var.branch_protections :
    "${item.repository}-${item.branch}" => item
  }

  repository     = each.value.repository
  branch         = each.value.branch
  enforce_admins = each.value.enforce_admins

  dynamic "required_pull_request_reviews" {
    for_each = each.value.required_pull_request_reviews != null ? [each.value.required_pull_request_reviews] : []
    content {
      dismiss_stale_reviews           = try(required_pull_request_reviews.value.dismiss_stale_reviews, false)
      dismissal_users                 = try(required_pull_request_reviews.value.dismissal_users, [])
      dismissal_teams                 = try(required_pull_request_reviews.value.dismissal_teams, [])
      require_code_owner_reviews      = try(required_pull_request_reviews.value.require_code_owner_reviews, false)
      required_approving_review_count = try(required_pull_request_reviews.value.required_approving_review_count, 0)
    }
  }

  # One can restrict who can push to a protected branch
  # Users, teams, or apps can be specified for team or enterprize plan.
  # For free plan, following users can push:
  # - organization administrators, repository administrators, and users with the Maintain role.
  dynamic "restrictions" {
    for_each = each.value.restrictions != null ? [each.value.restrictions] : []
    content {
      users = try(restrictions.value.users, [])
      teams = try(restrictions.value.teams, [])
      apps  = try(restrictions.value.apps, [])
    }
  }
  depends_on = [
    github_branch.this
  ]
}

resource "github_team_repository" "this" {
  for_each   = local.team_repository_permissions
  repository = each.value.repository
  team_id    = each.value.team_id
  permission = each.value.permission
  depends_on = [
    github_repository.this
  ]
}

resource "github_app_installation_repository" "this" {
  for_each = { for ind, item in var.github_app_installations :
    "${item.repository}-${item.installation_id}" => item
  }
  repository      = each.value.repository
  installation_id = each.value.installation_id

  depends_on = [
    github_repository.this
  ]
}

resource "github_actions_secret" "var" {
  for_each        = { for ind, item in local.repository_secrets : "${item.repository}-${item.secret_name}" => item }
  repository      = each.value.repository
  secret_name     = each.value.secret_name
  plaintext_value = each.value.value

  depends_on = [
    github_repository.this
  ]
}

resource "github_actions_organization_secret" "file" {
  for_each        = { for ind, item in var.organization_secret_from_file : item.secret_name => item }
  secret_name     = each.value.secret_name
  visibility      = each.value.visibility
  plaintext_value = file(each.value.secret_filename)

  selected_repository_ids = [
    for ind, item in each.value.repositories : data.github_repository.this[item].repo_id
  ]
}
