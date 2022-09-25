# terraform-aws-codedeploy

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-codedeploy/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-codedeploy)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-codedeploy.svg)](https://github.com/JamesWoolfenden/terraform-aws-codedeploy/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-codedeploy.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-codedeploy/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-codedeploy/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-codedeploy&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-codedeploy/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-codedeploy&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

```terraform
module "codedeploy" {
  source            = "JamesWoolfenden/budget/aws"
  version           = "0.0.1"
  tags= {
    pike="permissions"
  }
}
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codedeploy_app.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_app) | resource |
| [aws_codedeploy_deployment_config.pike](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_deployment_config) | resource |
| [aws_codedeploy_deployment_group.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_deployment_group) | resource |
| [aws_iam_role.deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AWSCodeDeployRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_sns_topic.deploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_configuration"></a> [alarm\_configuration](#input\_alarm\_configuration) | n/a | <pre>object({<br>    alarms  = list(string)<br>    enabled = bool<br>  })</pre> | <pre>{<br>  "alarms": [<br>    "my-alarm-name"<br>  ],<br>  "enabled": true<br>}</pre> | no |
| <a name="input_app"></a> [app](#input\_app) | n/a | `map(any)` | n/a | yes |
| <a name="input_auto_rollback_configuration"></a> [auto\_rollback\_configuration](#input\_auto\_rollback\_configuration) | n/a | <pre>object({<br>    events  = list(string)<br>    enabled = bool<br>  })</pre> | <pre>{<br>  "enabled": true,<br>  "events": [<br>    "DEPLOYMENT_FAILURE"<br>  ]<br>}</pre> | no |
| <a name="input_blue_green_config"></a> [blue\_green\_config](#input\_blue\_green\_config) | n/a | <pre>object({<br>    action_on_timeout                = string<br>    wait_time_in_minutes             = number<br>    green_action                     = string<br>    blue_action                      = string<br>    termination_wait_time_in_minutes = number<br>  })</pre> | <pre>{<br>  "action_on_timeout": null,<br>  "blue_action": null,<br>  "green_action": null,<br>  "termination_wait_time_in_minutes": null,<br>  "wait_time_in_minutes": null<br>}</pre> | no |
| <a name="input_config"></a> [config](#input\_config) | n/a | <pre>object({<br>    deployment_config_name = string<br>    minimum_healthy_hosts = object({<br>      type  = string<br>      value = number<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_deployment_config_name"></a> [deployment\_config\_name](#input\_deployment\_config\_name) | n/a | `string` | `"CodeDeployDefault.OneAtATime"` | no |
| <a name="input_deployment_group_name"></a> [deployment\_group\_name](#input\_deployment\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_ec2_tag_filters"></a> [ec2\_tag\_filters](#input\_ec2\_tag\_filters) | n/a | `list(any)` | n/a | yes |
| <a name="input_ecs_services"></a> [ecs\_services](#input\_ecs\_services) | n/a | `list(any)` | `[]` | no |
| <a name="input_elb_info"></a> [elb\_info](#input\_elb\_info) | n/a | `string` | `""` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | n/a | `any` | n/a | yes |
| <a name="input_load_balancer_info"></a> [load\_balancer\_info](#input\_load\_balancer\_info) | n/a | `list(any)` | `[]` | no |
| <a name="input_style"></a> [style](#input\_style) | n/a | `map(any)` | <pre>{<br>  "deployment_option": "WITHOUT_TRAFFIC_CONTROL",<br>  "deployment_type": "IN_PLACE"<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_traffic_routing_config"></a> [traffic\_routing\_config](#input\_traffic\_routing\_config) | n/a | <pre>list(object({<br>    type = string<br>    time_based_linear = list(object({<br>      interval   = number<br>      percentage = number<br>    }))<br>    time_based_canary = list(object({<br>      interval   = number<br>      percentage = number<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_trigger_configuration"></a> [trigger\_configuration](#input\_trigger\_configuration) | n/a | <pre>object({<br>    trigger_events = list(string)<br>    trigger_name   = string<br>  })</pre> | <pre>{<br>  "trigger_events": [<br>    "DeploymentFailure"<br>  ],<br>  "trigger_name": "example-trigger"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "SNS:CreateTopic",
                "SNS:DeleteTopic",
                "SNS:GetTopicAttributes",
                "SNS:ListTagsForResource",
                "SNS:SetTopicAttributes"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "iam:AttachRolePolicy",
                "iam:CreateRole",
                "iam:DeleteRole",
                "iam:DetachRolePolicy",
                "iam:GetRole",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:ListRolePolicies"
            ],
            "Resource": "*"
        }
    ]
})
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-codedeploy/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-codedeploy/issues) to report any bugs or file feature requests.

## Copyrights

Copyright 2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
