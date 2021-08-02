
# Creando un simple bucket pero claro que se pueden meter más funciones 
resource "google_storage_bucket" "my_bucket_xtian_pro" {
  name     = var.bucket_name
  location = var.region


}


resource "google_storage_bucket_object" "topsecret_info" {
  name   = "topsecretfile01"
  source = "./data/sheet-t.csv"
  bucket = google_storage_bucket.my_bucket_xtian_pro.name
}

