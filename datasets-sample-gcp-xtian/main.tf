provider "google" {

  credentials = file("../auth/xtianlabs-3e239c9b0508.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}


module "bucket_info" {
  source      = "../bucket-sample-gcp-xtian"
  bucket_name = var.bucket_name

}


resource "google_bigquery_dataset" "bigqry_fidw" {
  count = var.prevent_destroy ? 1 : 0
  dataset_id                  = "teradatadts"
  friendly_name               = "test-dtaset"
  description                 = "Nuestro super dataset de tipo tabla"
  location                    = "US"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }


  lifecycle {
    prevent_destroy = true
  }


}

#
#resource "google_bigquery_dataset" "bigqry_fidw2" {
#  count = var.prevent_destroy ? 0 : 1
#  dataset_id                  = "teradatadts"
#  friendly_name               = "test-dtaset"
#  description                 = "Nuestro super dataset de tipo tabla"
#  location                    = "US"
#  default_table_expiration_ms = 3600000
#
#  labels = {
#    env = "default"
#  }
#    depends_on = [
#    google_bigquery_dataset.bigqry_fidw[0],
#  ]
#
#}
#
#resource "google_bigquery_table" "default" {
#  dataset_id          = google_bigquery_dataset.bigqry_fidw[0].dataset_id
#  table_id            = "Tabla1"
#  deletion_protection = false
#
#  time_partitioning {
#    type = "DAY"
#  }
#
#  labels = {
#    env = "default"
#  }
#
#  schema = <<EOF
#[
#  {
#    "name": "permalink",
#    "type": "STRING",
#    "mode": "NULLABLE",
#    "description": "The Permalink"
#  },
#  {
#    "name": "state",
#    "type": "STRING",
#    "mode": "NULLABLE",
#    "description": "State where the head office is located"
#  }
#]
#EOF
#
#}
#
#
#resource "google_bigquery_table" "sheet" {
#  dataset_id          = google_bigquery_dataset.bigqry_fidw[0].dataset_id
#  table_id            = "secret-data"
#  deletion_protection = false
#
#  schema = <<EOF
#[
#  {
#    "name": "id",
#    "type": "STRING",
#    "mode": "NULLABLE",
#    "description": "el id de los paises"
#  },
#  {
#    "name": "Country",
#    "type": "STRING",
#    "mode": "NULLABLE",
#    "description": "algunos paises de ejemplo"
#  },
#    {
#    "name": "Quote",
#    "type": "INTEGER",
#    "mode": "NULLABLE",
#    "description": "monto de venta"
#  }
#]
#EOF
#
#
#
#
#  external_data_configuration {
#    autodetect    = true
#    source_format = "CSV"
#
#    source_uris = [
#      "${module.bucket_info.bucketurl}/${module.bucket_info.file_name}",
#    ]
#  }
#}
#
#
#
#resource "google_bigquery_table" "public" {
#  deletion_protection = false
#  dataset_id          = google_bigquery_dataset.bigqry_fidw[0].dataset_id
#  table_id            = "view-pro"
#
#  view {
#    query          = "SELECT * FROM `xtianlabs.teradatadts.secret-data` WHERE Country = 'Mexico'"
#    use_legacy_sql = false
#  }
#
#  depends_on = [
#    google_bigquery_table.sheet,
#  ]
#}
#
#
#resource "google_bigquery_table" "publicdataset" {
#  deletion_protection = false
#  dataset_id          = google_bigquery_dataset.bigqry_fidw[0].dataset_id
#  table_id            = "view-pro-public"
#
#  view {
#    query          = "SELECT EXTRACT(YEAR FROM creation_date) AS Year, EXTRACT(MONTH FROM creation_date) AS Month, COUNT(*) AS Number_of_Questions, ROUND(100 * SUM(IF (answer_count > 0, 1, 0)) / COUNT(*), 1) AS Percent_Questions_with_Answers FROM `bigquery-public-data.stackoverflow.posts_questions` GROUP BY Year, Month HAVING  Year > 2009 AND Year < 2016 ORDER BY Year"
#    use_legacy_sql = false
#  }
#
#  depends_on = [
#    google_bigquery_dataset.bigqry_fidw,
#  ]
#}
#
#



