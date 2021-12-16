# Read more about private google access at https://cloud.google.com/vpc/docs/configure-private-google-access?hl=en#config
module "cidr_restricted_googleapis" {
  source = "git::https:/github.com/binxio/terraform-cidr-expand.git?ref=1.1.0"

  cidr = "199.36.153.4/30"
}

resource "google_dns_managed_zone" "googleapis_com" {
  project  = var.project_id
  name     = "googleapis-com"
  dns_name = "googleapis.com"

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.network_id
    }
  }
}

resource "google_dns_record_set" "googleapis_com_base" {
  project      = var.project_id
  managed_zone = google_dns_managed_zone.googleapis_com.name
  name         = "restricted.googleapis.com."
  type         = "A"
  ttl          = 300
  rrdatas      = module.cidr_restricted_googleapis.ip_addresses
}

resource "google_dns_record_set" "googleapis_com_redirect" {
  project      = var.project_id
  managed_zone = google_dns_managed_zone.googleapis_com.name
  name         = "*.googleapis.com."
  type         = "CNAME"
  ttl          = 300
  rrdatas      = ["restricted.googleapis.com."]
}