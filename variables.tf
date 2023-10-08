variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

variable "user_uuid" {
 type = string
}

variable "medianxl" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "starve" {
  type = object({
    public_path = string
    content_version = number
  })
}