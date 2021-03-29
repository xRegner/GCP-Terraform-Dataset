variable "project_id" {
  description = "Acá se va a mapear el id del proyecto que viene del tfvars"
  type        = string
}


variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Google Cloud zone"
  type        = string
  default     = "us-central1-c"
}

variable "bucket_name" {
  description = "Esta se usa como variable con la que se puede crear un nombre basado en una convención"
  type        = string
}