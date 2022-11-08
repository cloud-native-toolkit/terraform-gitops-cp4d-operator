locals {
  name          = "cp4d-operator"
  yaml_dir      = "${path.cwd}/.tmp/${local.name}/chart/${local.name}"
  values_content = {
    cp4d = {
      operator_namespace   = var.namespace
      cpd_platform_channel = "v2.0"
    }
  }
  layer = "services"
  type = "base"
  application_branch = "main"
  namespace = var.namespace
  layer_config = var.gitops_config[local.layer]
}


resource null_resource create_yaml {
  provisioner "local-exec" {
    command = "${path.module}/scripts/create-yaml.sh '${local.name}' '${local.yaml_dir}'"

    environment = {
      VALUES_CONTENT = yamlencode(local.values_content)
    }
  }
}

resource gitops_module setup_gitops {
  depends_on = [null_resource.create_yaml]
  name = local.name
  namespace = local.namespace
  content_dir = local.yaml_dir
  server_name = var.server_name
  layer = local.layer
  type = local.type
  branch = local.application_branch
  config = yamlencode(var.gitops_config)
  credentials = yamlencode(var.git_credentials)
}