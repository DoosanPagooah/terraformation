variable "server_port" {

  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080

}

variable "alb_name" {

  description = "The value of the ALB"
  value = string
  default     = "terraform-asg-example"

}

variable "instance_security_group_name" {

  description = "The name of teh security group for the EC2 Instances"
  type        = string
  default     = "terraform-example-instances"

}

variable "alb_security_group_name" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "terraform-asg-example"

}
