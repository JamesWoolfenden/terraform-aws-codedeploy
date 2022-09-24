resource "aws_codedeploy_deployment_group" "example" {
  app_name               = aws_codedeploy_app.example.name
  deployment_config_name = var.deployment_config_name
  deployment_group_name  = var.deployment_group_name
  service_role_arn       = aws_iam_role.deploy.arn


  ec2_tag_set {
    dynamic "ec2_tag_filter" {
      for_each = var.ec2_tag_filters
      content {
        key   = ec2_tag_filter.value.key
        type  = ec2_tag_filter.value.type
        value = ec2_tag_filter.value.value
      }
    }
  }

  trigger_configuration {
    trigger_events     = var.trigger_configuration.trigger_events
    trigger_name       = var.trigger_configuration.trigger_name
    trigger_target_arn = aws_sns_topic.deploy.arn
  }

  auto_rollback_configuration {
    enabled = var.auto_rollback_configuration.enabled
    events  = var.auto_rollback_configuration.events
  }

  alarm_configuration {
    alarms  = var.alarm_configuration.alarms
    enabled = var.alarm_configuration.enabled
  }

  blue_green_deployment_config {

    deployment_ready_option {
      action_on_timeout    = var.blue_green_config.action_on_timeout
      wait_time_in_minutes = var.blue_green_config.wait_time_in_minutes
    }

    green_fleet_provisioning_option {
      action = var.blue_green_config.green_action
    }

    terminate_blue_instances_on_deployment_success {
      action                           = var.blue_green_config.blue_action
      termination_wait_time_in_minutes = var.blue_green_config.termination_wait_time_in_minutes
    }
  }

  deployment_style {
    deployment_option = var.style["deployment_option"]
    deployment_type   = var.style["deployment_type"]
  }

  dynamic "ecs_service" {
    for_each = var.ecs_services
    content {
      cluster_name = ecs_service.value.cluster_name
      service_name = ecs_service.value.service_name
    }
  }


  load_balancer_info {
    elb_info {
      name = var.elb_info
    }
    dynamic "target_group_pair_info" {
      for_each = var.load_balancer_info
      content {
        prod_traffic_route {
          listener_arns = target_group_pair_info.value.aws_lb_listener
        }

        target_group {
          name = target_group_pair_info.value.group_blue
        }

        target_group {
          name = target_group_pair_info.value.group_green
        }
      }
    }
  }
}
