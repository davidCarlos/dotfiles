#!/bin/bash
cd ansible
python -m venv .venv
pip install ansible-core
ansible-playbook -i inventory.yml  base.yml nvim.yml
