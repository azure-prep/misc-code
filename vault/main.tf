provider vault{
  address = "http://vault-int.azdevopsb1.online:8200"
  token   = var.token
}

resource "vault_mount" "kvv2" {
  for_each = var.secret
  path        = each.key
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "example" {
  for_each = var.values
  mount                      = each.value["secret"]
  name                       = "secret"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(each.value["values"])
}

# resource "vault_generic_secret" "example" {
#   for_each = var.values
#   path = "${each.value["secret"]}/${each.key}"
#
#   data_json = jsonencode(
#     {
#       "foo"   = "bar",
#       "pizza" = "cheese"
#     }
#   )
# }