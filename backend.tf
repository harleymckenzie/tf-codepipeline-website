terraform {
  cloud {
    organization = "hmckenzie"
    workspaces {
      tags = [
        "hmckenzie:web"
      ]
    }
  }
}
