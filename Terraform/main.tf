terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

resource "local_file" "infra_note" {
  content  = "Infrastructure for Teamavail app provisioned with Postgres and App container"
  filename = "${path.module}/infra_output.txt"
}

output "infra_message" {
  value = "Teamavail local infra ready"
}
