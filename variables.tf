//Bucket vars
variable "bucket_name" {
  default    = "hillel_18_podmogylnyi"
}

variable "bucket_location" {
  default    = "US"
}

//Compute vars
variable "compute_name" {
  default    = "compute-instance"
}

variable "compute_type" {
  default    = "f1-micro"
}

variable "compute_image" {
  default    = "debian-9-stretch-v20220519"
}