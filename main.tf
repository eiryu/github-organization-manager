variable "terraform_organization" {}
variable "terraform_workspace_name" {}

terraform {
  required_version = "~> 0.12"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = var.terraform_organization

    workspaces {
      name = var.terraform_workspace_name
    }
  }
}

provider "github" {
}

resource "github_membership" "membership" {
  # Use `compact` to remove blank lines
  for_each = toset(compact(split("\n", file("members.txt"))))

  username = each.value
  role     = "member"
}