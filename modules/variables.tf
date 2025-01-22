variable "macvlan" {
  type = object({
    parent           = string
    addresses        = list(string)
    netplan_template = string
  })
}
