resource "aws_sns_topic" "deploy" {
  name_prefix       = "deploy_"
  kms_master_key_id = var.kms_key_id
}
