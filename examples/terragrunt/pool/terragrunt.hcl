include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../cluster"]
}

dependency "kapsule-cluster" {
  config_path = "../cluster"
}

terraform {
  source = "github.com/4s3ti/kapsule-pool"
}

/* Add inputs here to override global inputs */
inputs = {
  kapsule_cluster_id          = dependency.kapsule-cluster.outputs.cluster_id
  pool_name                   = "test"
  pool_node_type              = "DEV1-M"
  pool_size                   = 2
  pool_max_size               = 4
  pool_min_size               = 1
  pool_max_surge              = 5
  pool_max_unavailable        = 1
  pool_autohealing            = true
}
