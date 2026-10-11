variable "migration_center_preference_sets" {
  description = <<EOT
Map of migration_center_preference_sets, attributes below
Required:
    - location
    - preference_set_id
Optional:
    - deletion_policy
    - description
    - display_name
    - project
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - virtual_machine_preferences (block):
        - commitment_plan (optional)
        - compute_engine_preferences (optional, block):
            - license_type (optional)
            - machine_preferences (optional, block):
                - allowed_machine_series (optional, block):
                    - code (optional)
            - persistent_disk_type (optional)
        - region_preferences (optional, block):
            - preferred_regions (optional)
        - sizing_optimization_strategy (optional)
        - sole_tenancy_preferences (optional, block):
            - commitment_plan (optional)
            - cpu_overcommit_ratio (optional)
            - host_maintenance_policy (optional)
            - node_types (optional, block):
                - node_name (optional)
        - target_product (optional)
        - vmware_engine_preferences (optional, block):
            - commitment_plan (optional)
            - cpu_overcommit_ratio (optional)
            - memory_overcommit_ratio (optional)
            - storage_deduplication_compression_ratio (optional)
EOT

  type = map(object({
    location          = string
    preference_set_id = string
    deletion_policy   = optional(string)
    description       = optional(string)
    display_name      = optional(string)
    project           = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    virtual_machine_preferences = optional(object({
      commitment_plan = optional(string)
      compute_engine_preferences = optional(object({
        license_type = optional(string)
        machine_preferences = optional(object({
          allowed_machine_series = optional(list(object({
            code = optional(string)
          })))
        }))
        persistent_disk_type = optional(string)
      }))
      region_preferences = optional(object({
        preferred_regions = optional(list(string))
      }))
      sizing_optimization_strategy = optional(string)
      sole_tenancy_preferences = optional(object({
        commitment_plan         = optional(string)
        cpu_overcommit_ratio    = optional(number)
        host_maintenance_policy = optional(string)
        node_types = optional(list(object({
          node_name = optional(string)
        })))
      }))
      target_product = optional(string)
      vmware_engine_preferences = optional(object({
        commitment_plan                         = optional(string)
        cpu_overcommit_ratio                    = optional(number)
        memory_overcommit_ratio                 = optional(number)
        storage_deduplication_compression_ratio = optional(number)
      }))
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

