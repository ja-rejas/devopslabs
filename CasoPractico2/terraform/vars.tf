variable "location" {
	type = string
	description = "Región de Azure donde crearemos la infraestructura"
	default = "West Europe"
}

variable "vm_size" {
	type = string
	description = "Tamaño de las máquinas virtuales"
	default = "Standard_D1_v2" #3.5 GB, 1 CPU
}

variable "vms" {
	description = "Máquinas virtuales a crear"
	type = list(string)
	default = ["master","nfs","worker1","worker2"]
}
