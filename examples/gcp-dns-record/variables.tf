variable "project_id" {
  description = "Project to deploy DNS managed zone to."
  type        = string
}

variable "network_id" {
  description = "Network to expose DNS managed zone to."
  type        = string
}