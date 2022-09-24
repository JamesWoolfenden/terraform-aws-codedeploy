variable "tags" {
  type = map(any)
}

variable "app" {
  type = map(any)
}


variable "config" {
  type = object({
    deployment_config_name = string
    minimum_healthy_hosts = object({
      type  = string
      value = number
    })
  })
}

variable "traffic_routing_config" {
  type = list(object({
    type = string
    time_based_linear = list(object({
      interval   = number
      percentage = number
    }))
    time_based_canary = list(object({
      interval   = number
      percentage = number
    }))
  }))

}

variable "trigger_configuration" {
  type = object({
    trigger_events = list(string)
    trigger_name   = string
  })
  default = {
    trigger_events = ["DeploymentFailure"]
    trigger_name   = "example-trigger"
  }
}

variable "ec2_tag_filters" {
  type = list(any)
}


variable "auto_rollback_configuration" {
  type = object({
    events  = list(string)
    enabled = bool
  })

  default = {
    events  = ["DEPLOYMENT_FAILURE"]
    enabled = true
  }
}

variable "alarm_configuration" {
  type = object({
    alarms  = list(string)
    enabled = bool
  })

  default = {
    alarms  = ["my-alarm-name"]
    enabled = true
  }
}

variable "deployment_group_name" {
  type = string
}

variable "deployment_config_name" {
  type    = string
  default = "CodeDeployDefault.OneAtATime"
}

variable "elb_info" {
  type    = string
  default = ""
}

variable "load_balancer_info" {
  type    = list(any)
  default = []
}

variable "ecs_services" {
  type    = list(any)
  default = []
}

variable "style" {
  type = map(any)
  default = {
    deployment_option = "WITHOUT_TRAFFIC_CONTROL"
    deployment_type   = "IN_PLACE"
  }
}

variable "blue_green_config" {
  type = object({
    action_on_timeout                = string
    wait_time_in_minutes             = number
    green_action                     = string
    blue_action                      = string
    termination_wait_time_in_minutes = number
  })
  default = {
    action_on_timeout                = null
    wait_time_in_minutes             = null
    green_action                     = null
    blue_action                      = null
    termination_wait_time_in_minutes = null
  }


}