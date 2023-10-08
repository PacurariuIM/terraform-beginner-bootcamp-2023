## Terrahome AWS

```tf
module "home_starve_hosting" {
 source = "./modules/terrahome_aws"
 user_uuid = var.user_uuid
 public_path = var.starve.public_path
 content_version = var.starve.content_version
}
```

The public directory expects the following:
- index.html
- error.html
- assets

All top level files in assets will be copied, but not any subdirectories.