cd ~/misc-code/tools-setup && make apply

#download keys

cd ~/misc-code/tools-setup/tools/
git pull;ansible-playbook -i vault-int.azdevopsb1.online, -e ansible_user=azuser -e ansible_password=DevOps@123 -e component=vault main.yml

export VAULT_ADDR='http://127.0.0.1:8200'
vault operator init -key-shares=1 -key-threshold=1 -format=json > vault-keys.json

cat vault-keys.json
vault operator unseal "$(jq -r '.unseal_keys_b64[0]' vault-keys.json)"
export VAULT_TOKEN=$(jq -r '.root_token' vault-keys.json)
echo $VAULT_TOKEN


cd ~/misc-code/vault
git pull;make apply token=${VAULT_TOKEN}





