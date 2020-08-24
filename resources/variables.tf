


variable "cloudFunctionName"{
	type =string
	description = "name of the cloud function"
	
}
variable "runtime"{
	type =string
	description = "name of the runtime for cloud function"
	
}

variable "entrypoint"{
	type =string
	description = "name of the entry point cloud function"
	
}

variable "event_type"{
	type =string
	description = "name of the event type cloud function"
	
}