variable "credentials_path" {
  type        = string
  description = "Provider credentials path (Ex. ~/.gcp/credentials.json)"
  default     = ""
}

variable "region" {
  type        = string
  description = "Region name (Free tier allowed in us-west1, us-central and us-east1)"
  default     = "us-east1"
  validation {
    condition     = (var.region == "us-east1") || (var.region == "us-west1") || (var.region == "us-central1")
    error_message = "This region are not on google free tier (allowed just in us-west1, us-central and us-east1), if you really need to specify another region see variables.tf and exclude validation block in region variable block, after that, set the variable region value with the region that you want"
  }
}

variable "enable_sa_resource" {
  description = "Create a service account to be used with terraform. Skip this if you already have a service account."
  type        = bool
  default     = true
}

variable "service_account_name" {
  type        = string
  description = "Service account name"
  default     = "tfwebportsa"
}

variable "project_id" {
  type        = string
  description = "Project ID"
}