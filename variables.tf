variable "subnetwork" {
  type        = string
  description = "Name of the subnet to attach instances"
  default = "vpn-vpc-subnet"
}

variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "primary_region" {
  description = "The primary region to be used"
  default= "us-central1"
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
}

variable "primary_zones" {
  description = "The primary zones to be used"
}

variable "network_name" {
  type        = string
  description = "Name of VPC network"
}

variable "ip_range_pods" {
  type        = string
  description = "The name of the secondary subnet ip range to use for pods"
  default = ""
}

variable "ip_range_services" {
  type        = string
  description = "The name of the secondary subnet range to use for services"
  default = ""
}

variable "compute_engine_service_account" {
  description = "Service account to associate to the nodes in the cluster"
}
