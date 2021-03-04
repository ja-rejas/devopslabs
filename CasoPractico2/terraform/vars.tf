variable "location" {
	type = string
	description = "Región de Azure donde crearemos la infraestructura"
	default = "West Europe"
}

# Si posteriormente necesitamos modificar el tipo de máquina a instalar, será en est pundo donde lo tenemos
# que hacer. De este modo, solo tenemos que cambiarlo en este punto. Esto también implicará que todas las VMs 
# que provisionemos tendrán las mismas características.
variable "vm_size" {
	type = string
	description = "Tamaño de las máquinas virtuales"
	default = "Standard_D1_v2" #3.5 GB, 1 CPU
}

# En la variable vms, definiremos el array con los nombres de las máquinas virtuales que queremos instalar
# se utilizarán tanto los nombres como los índices de esta varieble para configurar los elementos repetitivos
# como por ejemplos las NICs, las IpPublicas, las propias máquinas virtuales, etc.
variable "vms" {
	description = "Máquinas virtuales a crear"
	type = list(string)
	default = ["master","nfs","worker1","worker2"]
}
