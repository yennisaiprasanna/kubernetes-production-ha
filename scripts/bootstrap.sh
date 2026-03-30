#!/bin/bash

ansible-playbook -i ansible/inventory.ini ansible/playbooks/host-conf.yml
ansible-playbook -i ansible/inventory.ini ansible/playbooks/k8s-prereqs.yml
ansible-playbook -i ansible/inventory.ini ansible/playbooks/containerd-cri.yml