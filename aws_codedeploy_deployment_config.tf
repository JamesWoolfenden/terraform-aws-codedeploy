resource "aws_codedeploy_deployment_config" "pike" {
  deployment_config_name = var.config.deployment_config_name

  minimum_healthy_hosts {
    type  = var.config.minimum_healthy_hosts.type
    value = var.config.minimum_healthy_hosts.value
  }


  dynamic "traffic_routing_config" {
    for_each = var.traffic_routing_config
    content {
      type = traffic_routing_config.value.type

      dynamic "time_based_linear" {
        for_each = traffic_routing_config.value.time_based_linear
        content {
          interval   = time_based_linear.value.interval
          percentage = time_based_linear.value.percentage
        }
      }

      dynamic "time_based_canary" {
        for_each = traffic_routing_config.value.time_based_canary
        content {
          interval   = time_based_canary.value.interval
          percentage = time_based_canary.value.percentage
        }
      }

    }
  }



}


