#!/bin/bash

LOCAL_OVERRIDE_FILE=./etc/vault_secret.local.sh
LOGIN_HELPER_SCRIPT=/usr/local/bin/vault-passphrase-helper

# script on the login servers
# to read passphrase from /root
if [ -e "$LOGIN_HELPER_SCRIPT" ]; then
    exec $LOGIN_HELPER_SCRIPT
fi

if [[ ! -z "${ANSIBLE_VAULT_PASSWORD}" ]]; then
  echo ${ANSIBLE_VAULT_PASSWORD}
  exit 0
fi

if [ -f $LOCAL_OVERRIDE_FILE ]; then
   exec $LOCAL_OVERRIDE_FILE
else
    read -s -p "Please enter the vault password: " pw
    echo $pw
fi
