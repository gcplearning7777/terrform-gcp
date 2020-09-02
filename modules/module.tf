provider "google" {
  credentials = file("account.json")
  project     = "ionic-angular-app-982ab"
  region      = "us-central1"
  
}

module "redis" {
	source = "../resources"
	
}


