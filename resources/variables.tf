variable "feedFileDropzone"{
	type =string
	description = "name of the storage bucket where feed file would be uploaded."
	
}

variable "source-code-uploader"{
	type =string
	description = "name of the storage bucket where source code would be uploaded."
	
}

variable "archivedZipName"{
	type =string
	description = "name of the source code zip file that would be uploaded"
	
}


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