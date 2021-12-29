provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                  = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster/"
  project_id              = var.project_id
  name                    = var.cluster_name
  region                  = var.primary_region
  zones                   = var.primary_zones
  network                 = var.network_name
  subnetwork              = var.subnetwork
  ip_range_pods           = var.ip_range_pods
  ip_range_services       = var.ip_range_services
  http_load_balancing     = true
  create_service_account  = false
  service_account         = var.compute_engine_service_account

  node_metadata = "GKE_METADATA_SERVER" 
  node_pools = [
    {
      name          = "cluster3-node-pool"
      autoscaling   = true
      min_count     = 1
      max_count     = 5
      auto_repair   = true
      auto_upgrade  = true
      machine_type  = "e2-standard-4"
      preemptible   = false
    },
  ]
  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/cloud_debugger",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly"
    ]
  }
  node_pools_tags = {
    all = [
      "cluster3",
    ]
  }
}
