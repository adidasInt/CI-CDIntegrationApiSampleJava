#
# Google Cloud Platform
#
provider "google" {
  credentials = "${file("adidas-test-3331b35e63b4.json")}"
  project = "${var.project}"
  region  = "${var.region}"
}