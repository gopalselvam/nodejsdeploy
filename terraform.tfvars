# Google region to deploy gke cluster
primary_region      = "us-central1"
# Google zones 
primary_zones      = ["us-central1-a", "us-central1-b", "us-central1-f"]
# project ID to deploy gke cluser
project_id   = "dc-test-deploy"
# VPC network
network_name = "vpn-vpc"
# GKE cluster name
cluster_name = "gke-cluster-nodejs"
# Service acount
compute_engine_service_account = "tf-gke-code-cluster@dc-test-deploy.iam.gserviceaccount.com"
