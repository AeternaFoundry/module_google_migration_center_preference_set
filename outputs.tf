output "migration_center_preference_sets_id" {
  description = "Map of id values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no id are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "migration_center_preference_sets_create_time" {
  description = "Map of create_time values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no create_time are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "migration_center_preference_sets_deletion_policy" {
  description = "Map of deletion_policy values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no deletion_policy are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "migration_center_preference_sets_description" {
  description = "Map of description values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no description are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => v.description if v.description != null && length(v.description) > 0 }
}
output "migration_center_preference_sets_display_name" {
  description = "Map of display_name values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no display_name are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "migration_center_preference_sets_location" {
  description = "Map of location values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no location are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => v.location if v.location != null && length(v.location) > 0 }
}
output "migration_center_preference_sets_name" {
  description = "Map of name values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no name are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "migration_center_preference_sets_preference_set_id" {
  description = "Map of preference_set_id values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no preference_set_id are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => v.preference_set_id if v.preference_set_id != null && length(v.preference_set_id) > 0 }
}
output "migration_center_preference_sets_project" {
  description = "Map of project values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no project are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => v.project if v.project != null && length(v.project) > 0 }
}
output "migration_center_preference_sets_update_time" {
  description = "Map of update_time values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no update_time are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}
output "migration_center_preference_sets_virtual_machine_preferences" {
  description = "Map of virtual_machine_preferences values across all migration_center_preference_sets, keyed the same as var.migration_center_preference_sets except keys with no virtual_machine_preferences are omitted"
  value       = { for k, v in google_migration_center_preference_set.migration_center_preference_sets : k => one(v.virtual_machine_preferences) if v.virtual_machine_preferences != null && length(v.virtual_machine_preferences) > 0 }
}

