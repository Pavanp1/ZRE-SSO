
variable "permission_set_arn" {
  description = "The ARN of the Permission Set that the admin wants to grant the principal access to."
  type        = string
}

variable "groups" {
  description = "List of names of Group entities who can access to the Permission Set."
  type        = list(string)
  default     = []
}

variable "users" {
  description = "List of names of User entities who can access to the Permission Set."
  type        = list(string)
  default     = []
}

variable "account_id" {
  description = "List of maps containing mapping between user/group, permission set and assigned accounts list. See account_assignments description in README for more information about map values."
  type = list(object({
    account_ids = list(string)
  }))

  default = []
}
