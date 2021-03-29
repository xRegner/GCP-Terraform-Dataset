output "bucketurl" {
  value = google_storage_bucket.my_bucket_xtian_pro.url
}

output "file_name" {
  value = google_storage_bucket_object.topsecret_info.name
}
