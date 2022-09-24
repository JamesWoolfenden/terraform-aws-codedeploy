module "codedeploy" {
  source                 = "../../"
  deployment_group_name  = "pike"
  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"
  app = {
    compute_platform = "ECS"
    name             = "example"
  }
  config = {
    deployment_config_name = "test-deployment-config"
    minimum_healthy_hosts = {
      type  = "HOST_COUNT"
      value = 2
    }
  }
  traffic_routing_config = [{
    type = "TimeBasedLinear"

    time_based_linear = [{
      interval   = 10
      percentage = 15
    }]

    time_based_canary = []
  }]

  ec2_tag_filters = []

  blue_green_config={
     action_on_timeout = "CONTINUE_DEPLOYMENT"
      wait_time_in_minutes= 5
      green_action=null
      blue_action = "TERMINATE"
      termination_wait_time_in_minutes = 5
  }

  style={
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  ecs_services = [{
    cluster_name = data.aws_ecs_cluster.pike.arn
    service_name = data.aws_ecs_service.pike.service_name
  }]
  
  load_balancer_info=[{
    aws_lb_listener=["some_arn"]
    group_blue="blue"
    group_green="green"
  }]

  tags = {
    pike = "permissions"
  }
}

data "aws_ecs_cluster" "pike" {
  cluster_name = "pike"
}

data "aws_ecs_service" "pike" {
  service_name = "pike"
  cluster_arn  = data.aws_ecs_cluster.pike.arn
}