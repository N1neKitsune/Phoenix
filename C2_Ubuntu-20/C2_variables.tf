variable "name" {
    description = "Name for your vm"
    default = "C2_Ubuntu-20_Tera"
}

variable "number" {
    description = "Number of machine you want"
    default = 1
}

variable "image" {
    description = "URL for downloading the image or directly set a path to her"
    default = "https://app.vagrantup.com/bento/boxes/ubuntu-20.04/versions/202206.03.0/providers/virtualbox.box"
}

variable "cpus" {
    description = "At least 2"
    default = 4
}

variable "memory" {
    description = "At least 2 Giga"
    default = "8096 mib"
}

variable "host_interface" {
    description = "Your network physique network interface"
    default = "Intel(R) Ethernet Connection (7) I219-LM"
}
