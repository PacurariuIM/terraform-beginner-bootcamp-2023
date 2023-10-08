terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  cloud {
   organization = "crazyfroggg"
   workspaces {
     name = "TerraHouse-1"
   }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid= var.user_uuid
  token= var.terratowns_access_token
}

module "home_medianxl_hosting" {
 source = "./modules/terrahome_aws"
 user_uuid = var.user_uuid
 public_path = var.medianxl.public_path
 content_version = var.medianxl.content_version
}

resource "terratowns_home" "home" {
  name = "Median XL Sigma- a Diablo 2 Mod"
  description = <<DESCRIPTION
The most popular Diablo II overhaul modification, 
Median XL is an action RPG with extensive endgame content, 
deep character customisation and challenging gameplay. 
It offers thousands of new items, new skills for all classes, 
and multiple improvements to the Diablo II engine.
DESCRIPTION
  domain_name = module.home_medianxl_hosting.domain_name
  town = "missingo"
  content_version = var.medianxl.content_version
}

module "home_starve_hosting" {
 source = "./modules/terrahome_aws"
 user_uuid = var.user_uuid
 public_path = var.starve.public_path
 content_version = var.starve.content_version
}

resource "terratowns_home" "home_starve" {
  name = "Don't Starve Together- Survival co-op adventure"
  description = <<DESCRIPTION
Don't Starve Together is the standalone multiplayer expansion 
of the uncompromising wilderness survival game, Don't Starve. 
Enter a strange and unexplored world full of strange creatures, 
dangers, and surprises. Gather resources to craft items and 
structures that match your survival style.
DESCRIPTION
  domain_name = module.home_starve_hosting.domain_name
  town = "missingo"
  content_version = var.starve.content_version
}