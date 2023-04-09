locals {

  # Get the list of user logins from the GitHub organization
  members = sort(data.github_organization.org.users[*].login)

  # Get the list of private repos from the GitHub Organization
  private_repositories = sort([
    for repo in local.repositories : repo
    if data.github_repository.repo[repo].visibility == "private"
  ])

  # Get the list of public repos from the GitHub Organization
  public_repositories = sort([
    for repo in local.repositories : repo
    if data.github_repository.repo[repo].visibility == "public"
  ])

  # Get the list of repos from the GitHub Organization
  repositories = sort([for repo in data.github_organization.org.repositories : replace(repo, "${var.organization}/", "")])

  # Get the list of teams from the GitHub Organization
  teams = sort(data.github_organization_teams.org.teams[*].slug)

}
