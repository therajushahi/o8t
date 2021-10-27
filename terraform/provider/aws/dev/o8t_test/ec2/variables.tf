variable "instance_name" {
  type = map
  default = {
    "web-server" = "subnet-09db19679a4ac245e"
    "health-check" = "subnet-05005ff593e0eb1f2"
  }
}