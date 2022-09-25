resource "aws_codedeploy_app" "example" {
  compute_platform = var.app.compute_platform
  name             = var.app.name
  tags             = var.tags
}
