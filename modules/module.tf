provider "google" {
  credentials = file("account.json")
  project     = "ionic-angular-app-982ab"
  region      = "us-central1"
  
}

module "cloudfunction" {
	source = "../resources"
	
	cloudFunctionName		= "dataFlowTriggerer"
	runtime				= "nodejs10"
	entrypoint		        = "processDataflow"
	event_type 			= "google.storage.object.finalize"
}
