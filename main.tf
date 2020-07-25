terraform {
  required_version = "~> 0.12"
}

provider "github" {
}

resource "github_membership" "membership" {
  # Use `compact` to remove blank lines
  for_each = toset(compact(split("\n", file("members.txt"))))

  username = each.value
  role     = "member"
}