module "codedeploy" {
  source                = "../../"
  deployment_group_name = "pike"

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

  ec2_tag_filters = [
    {
      key   = "filterkey1"
      type  = "KEY_AND_VALUE"
      value = "filtervalue"
    },
    {
      key   = "filterkey2"
      type  = "KEY_AND_VALUE"
      value = "filtervalue"
    }
  ]
  kms_key_id = aws_kms_key.example.arn
  tags = {
    pike = "permissions"
  }
}
