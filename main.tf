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
  #cloud {
  #  organization = "ExamPro"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid= var.user_uuid
  token= var.terratowns_access_token
}

module "terrahouse_aws" {
 source = "./modules/terrahouse_aws"
 user_uuid = var.user_uuid
 index_html_filepath = var.index_html_filepath
 error_html_filepath = var.error_html_filepath
 content_version = var.content_version
 assets_path = var.assets_path
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
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}
