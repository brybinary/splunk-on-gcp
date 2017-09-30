# variables.tf

variable "google_project_id" { default = "boshgcp1" }
variable "account_file"      { default = "~/GCP/boshgcp1-bb869f65227e.json" }
variable "region" 	     { default = "europe-west1" }
variable "zone" 	     { default = "europe-west1-b" }
variable "tags" 	     { default = ["splunk-cluster-master", "splunk-index-slave-1","splunk-index-slave-2","splunk-index-slave-3","splunk-search-head-1","splunk-search-head-2", "splunk-search-head-3","splunk-heavy-forwarder-1"] }
variable "image" 	     { default = "centos-7-v20170918" }
variable "machine_type"      { default = "f1-micro" }
