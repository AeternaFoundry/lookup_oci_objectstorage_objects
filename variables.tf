variable "objectstorage_objects_lookup" {
  description = <<EOT
Map of objectstorage_objects_lookup, attributes below
Required:
    - bucket
    - namespace
Optional:
    - delimiter
    - end
    - prefix
    - start
    - start_after
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    bucket      = string
    namespace   = string
    delimiter   = optional(string)
    end         = optional(string)
    prefix      = optional(string)
    start       = optional(string)
    start_after = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

