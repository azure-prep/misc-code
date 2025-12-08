apply:
	git pull
	rm -rf .terraform
	terraform init  -backend-config=terraform-state.tfvars
	terraform apply -auto-approve
destroy:
	git pull
	terraform init  -backend-config=terraform-state.tfvars
	terraform destroy -auto-approve