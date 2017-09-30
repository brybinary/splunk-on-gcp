# splunk.tf
resource "google_compute_instance" "splunk-site-1-ew2-node-" {
    count = "${length(var.tags)}"
    name = "splunk-site-1-ew2-node-${count.index+1}"
    machine_type = "${var.machine_type}"
    zone = "${var.zone}"
    tags = ["${var.tags[count.index]}"]

    disk = {
    image = "${var.image}"
    }

    network_interface {
      network = "default"
      access_config {
	// Ephemeral IP
      }
    }
}
