resource "google_migration_center_preference_set" "migration_center_preference_sets" {
  for_each = var.migration_center_preference_sets

  location          = each.value.location
  preference_set_id = each.value.preference_set_id
  deletion_policy   = each.value.deletion_policy
  description       = each.value.description
  display_name      = each.value.display_name
  project           = each.value.project

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "virtual_machine_preferences" {
    for_each = each.value.virtual_machine_preferences != null ? [each.value.virtual_machine_preferences] : []
    content {
      commitment_plan = virtual_machine_preferences.value.commitment_plan
      dynamic "compute_engine_preferences" {
        for_each = virtual_machine_preferences.value.compute_engine_preferences != null ? [virtual_machine_preferences.value.compute_engine_preferences] : []
        content {
          license_type = compute_engine_preferences.value.license_type
          dynamic "machine_preferences" {
            for_each = compute_engine_preferences.value.machine_preferences != null ? [compute_engine_preferences.value.machine_preferences] : []
            content {
              dynamic "allowed_machine_series" {
                for_each = machine_preferences.value.allowed_machine_series != null ? machine_preferences.value.allowed_machine_series : []
                content {
                  code = allowed_machine_series.value.code
                }
              }
            }
          }
          persistent_disk_type = compute_engine_preferences.value.persistent_disk_type
        }
      }
      dynamic "region_preferences" {
        for_each = virtual_machine_preferences.value.region_preferences != null ? [virtual_machine_preferences.value.region_preferences] : []
        content {
          preferred_regions = region_preferences.value.preferred_regions
        }
      }
      sizing_optimization_strategy = virtual_machine_preferences.value.sizing_optimization_strategy
      dynamic "sole_tenancy_preferences" {
        for_each = virtual_machine_preferences.value.sole_tenancy_preferences != null ? [virtual_machine_preferences.value.sole_tenancy_preferences] : []
        content {
          commitment_plan         = sole_tenancy_preferences.value.commitment_plan
          cpu_overcommit_ratio    = sole_tenancy_preferences.value.cpu_overcommit_ratio
          host_maintenance_policy = sole_tenancy_preferences.value.host_maintenance_policy
          dynamic "node_types" {
            for_each = sole_tenancy_preferences.value.node_types != null ? sole_tenancy_preferences.value.node_types : []
            content {
              node_name = node_types.value.node_name
            }
          }
        }
      }
      target_product = virtual_machine_preferences.value.target_product
      dynamic "vmware_engine_preferences" {
        for_each = virtual_machine_preferences.value.vmware_engine_preferences != null ? [virtual_machine_preferences.value.vmware_engine_preferences] : []
        content {
          commitment_plan                         = vmware_engine_preferences.value.commitment_plan
          cpu_overcommit_ratio                    = vmware_engine_preferences.value.cpu_overcommit_ratio
          memory_overcommit_ratio                 = vmware_engine_preferences.value.memory_overcommit_ratio
          storage_deduplication_compression_ratio = vmware_engine_preferences.value.storage_deduplication_compression_ratio
        }
      }
    }
  }
}

