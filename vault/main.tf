provider vault{
  address = "https://vault-int.azdevopsb1.online:8200"
  token   = var.token
}

resource "vault_mount" "secret" {
  for_each = var.secret
  namespace = each.key
  path      = "secrets"
  type      = "kv"
  options = {
    version = "2"
  }
}

resource "vault_generic_secret" "example" {
  for_each = var.values
  path = each.key["secret"]/each.key

  data_json = jsonencode(
    {
      "foo"   = "bar",
      "pizza" = "cheese"
    }
  )
}