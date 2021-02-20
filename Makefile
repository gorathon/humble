ping:
	@echo "Pinging the hosts ..." 
	@cd scripts/ansible && ansible all -m ping

init:
	@cd infras && terraform init

plan:
	tfenv use 0.14.5
	@cd infras && terraform plan

fmt: 
	@cd infras && terraform fmt

apply:
	tfenv use 0.14.5
	@cd infras && terraform apply

destroy:
	tfenv use 0.14.5
	@cd infras && terraform destroy

clean:
	@rm -rf infras/terraform.tfstate.** infras/dev.log infras/rke_debug.log

cleanup-nodes:
	@cd scripts/ansible/ && ansible-playbook clean_up.yaml -K

start-ddns:
	@cd scripts/ansible/ && ansible-playbook start_ddns.yaml -K

shutdown:
	@cd scripts/ansible/ && ansible-playbook shutdown.yaml -K

.PHONY: infras
infras:
	make -C infras

.PHONY: platform
platform:
	make -C platform

.PHONY: apps
apps:
	make -C apps
