resource "vault_mount" "kvv2" {
  for_each = var.secret
  path        = each.key
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "example" {
  for_each                   = var.values
  mount                      = each.value["secret"]
  name                       = each.key
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(each.value["values"])
}