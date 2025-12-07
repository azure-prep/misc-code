# Copyright IBM Corp. 2016, 2025
# SPDX-License-Identifier: BUSL-1.1

# Full configuration options can be found at https://developer.hashicorp.com/vault/docs/configuration

ui = true

storage "file" {
  path = "/opt/vault/data"
}

HTTP listener
listener "tcp" {
 address = "0.0.0.0:8200"
 tls_disable = 1
}
