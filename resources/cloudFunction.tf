
resource "google_cloudfunctions_function" "function" {
  name        = var.cloudFunctionName
  description = "cloud function to trigger data flow pipeline"
  runtime     = var.runtime

  available_memory_mb   = 256
  source_archive_bucket = "source-code-uploader"
  source_archive_object = "sourceCode.zip"
  entry_point           = var.entrypoint 
  event_trigger		{
  				event_type = var.event_type
  				resource   = "drop-feed-file"
  
  			 }
}

