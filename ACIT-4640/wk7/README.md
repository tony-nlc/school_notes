1. Generate SSH key
```bash
ssh-keygen -t ed25519 -f ~/.ssh/aws
./scripts/import_lab_key ~/.ssh/aws.pub
```

2. init  Terraform and apply
```bash
terraform init
terraform fmt
terraform validate
terraform plan -out lab
terraform apply
```

3. Update the `playbook.yml` and run the following command
```
ansible-playbook playbook.yml --syntax-check
ansible-playbook playbook.yml --check

```