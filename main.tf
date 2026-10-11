data "oci_objectstorage_objects" "objectstorage_objects_lookup" {
  for_each = var.objectstorage_objects_lookup

  bucket      = each.value.bucket
  namespace   = each.value.namespace
  delimiter   = each.value.delimiter
  end         = each.value.end
  prefix      = each.value.prefix
  start       = each.value.start
  start_after = each.value.start_after

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

