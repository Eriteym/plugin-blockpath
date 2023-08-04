#!/bin/sh
sudo apt install openssh-server ansible

SCRIPTSRC=`readlink -f "$0" || echo "$0"`
SCRIPT_PATH=`dirname "$SCRIPTSRC" || echo .`

. ${SCRIPT_PATH}/config.sh

ansible-playbook -u "$REMOTE_OS_USER" -i hosts -e "ansible_python_interpreter=/usr/bin/python3 ansible_password=$REMOTE_OS_USER_PASSWORD ansible_become_password=$REMOTE_OS_USER_PASSWORD" java_dev.yml