variable "ambiente" {
  type        = string
  description = ""
}

variable "regiao" {
  type        = string
  description = ""
}

variable "regiao_names" {
  description = "Region names."
  default = {
    us-east-1 = "virginia"
    us-east-2 = "ohio"
    us-west-1 = "california"
    us-west-2 = "oregon"
  }
}

variable "autoscale_min" {
  default     = "1"
  description = "Minimum autoscale"
}

variable "autoscale_max" {
  default     = "4"
  description = "Maximum autoscale"
}

variable "amis" {
  description = "Images avaiables."
  default = {
    us-east-1 = "ami-0a6b2839d44d781b2"
    us-east-2 = "ami-0ada6d94f396377f2"
    us-west-1 = "ami-0f4feb99425e13b50"
    us-west-2 = "ami-0530ca8899fac469f"
  }
}

variable "key_pair_pbt" {
  default     = ""
  description = "key pair"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "instance type"
}

variable "root-block-device-size" {
  type    = any
  default = 10
}