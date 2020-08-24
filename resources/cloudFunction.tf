



resource "google_storage_bucket" "codeUpload" {
  name = var.source-code-uploader  
}



resource "google_storage_bucket" "dropzone" {
  name = var.feedFileDropzone  
}




resource "google_storage_bucket_object" "archive" {
  name   = "sourceCode.zip"
  bucket = google_storage_bucket.codeUpload.name
  source = "../code/sourceCode.zip"
}






resource "google_cloudfunctions_function" "function" {
  name        = var.cloudFunctionName
  description = "cloud function to trigger data flow pipeline"
  runtime     = var.runtime

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.codeUpload.name
  source_archive_object = google_storage_bucket_object.archive.name
  entry_point           = var.entrypoint 
  event_trigger		{
  				event_type = var.event_type
  				resource   = var.feedFileDropzone
  
  			 }
}

