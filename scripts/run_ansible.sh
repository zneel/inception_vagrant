#!/bin/bash

mkdir ~/.playbooks
cp /vagrant/playbooks/playbook.yml ~/.playbooks/
ansible-playbook ~/.playbooks/playbook.yml
