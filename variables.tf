variable "ingress_ports" {
  type = map(string)
  default = {
    "SSH": "22"
  }
}

variable "instance_type" {
  default = "t2.micro"
  validation {
    condition = var.instance_type == "t2.micro"
    error_message = "instance type can only be t2.micro"
  }
}

variable "number_of_instances" {
  default = 1
  type = number
  validation {
    condition = var.number_of_instances <= 3
    error_message = "Number of instances can be less than 3 only"
  }
}

variable "user_data" {
  default = "./user-data.sh"
  type = string
}