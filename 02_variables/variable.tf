variable "myami" {
  default = "ami-0c2af51e265bd5e0e"
  type = string
  description = "add any image id from the ap sourth region"
}

variable "myinstance" {
  default = "t2.micro"
  type = string
  description = "add any instance type"
}
variable "ssh_key_name" {
  default = "devops_keypair" # Replace with your SSH key name
}