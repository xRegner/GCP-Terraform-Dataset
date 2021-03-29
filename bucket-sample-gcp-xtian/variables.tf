
variable "bucket_name" {
  description = "Esta se usa como variable con la que se puede crear un nombre basado en una convención"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}