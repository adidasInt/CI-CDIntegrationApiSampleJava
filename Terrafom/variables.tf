#
# Variables
#
variable "project" {
  default = "adidas-test-233013"
}

variable "region" {
  default = "eu-west2-a"
}

variable "cluster_name" {
  default = "adidas-test-k8s-cluster"
}

variable "cluster_zone" {
  default = "europe-west1-b"
}

variable "cluster_k8s_version" {
  default = "1.11.7-gke.4"
}

variable "master_username" {
  default = "adidas-test"
}

variable "master_password" {
  default = "adidas-test20192702"
}

variable "initial_node_count" {
  default = 2
}

variable "autoscaling_min_node_count" {
  default = 2
}

variable "autoscaling_max_node_count" {
  default = 3
}

variable "disk_size_gb" {
  default = 20
}

variable "disk_type" {
  default = "pd-standard"
}

variable "machine_type" {
  default = "g1-small"
}