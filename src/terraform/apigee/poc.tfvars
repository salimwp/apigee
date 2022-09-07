project_id = "kinetic-pilot-360310"

ax_region = "us-west1"

apigee_environments = ["eval", "prod"]

apigee_instances = {
  usw1-instance = {
    region       = "us-west1"
    ip_range     = "10.0.0.0/22"
    environments = ["eval", "prod"]
  }
}

apigee_envgroups = {
  eval = {
    environments = ["eval"]
    hostnames    = ["apigee-dev.elysautus.io","apigee-test.elysautus.io"]
  }
  prod = {
    environments = ["prod"]
    hostnames    = ["apigee.elysautus.io"]
  }
}

network = "apigee-network"

exposure_subnets = [
  {
    name               = "apigee-exposure"
    ip_cidr_range      = "10.100.0.0/24"
    region             = "europe-west1"
    secondary_ip_range = null
  }
]

peering_range = "10.0.0.0/22"
support_range = "10.1.0.0/28"