#!/bin/bash
sudo dnf install python-pip -y
python -m venv .venv
source .venv/bin/activate
pip install ansible-core
# ansible-playbook -i inventory.yml base.yml nvim.yml
