provider "github" {
  owner = var.github_owner
  app_auth {} # Using env variables GITHUB_APP_ID, GITHUB_APP_INSTALLATION_ID and GITHUB_APP_PEM_FILE for auth
}
