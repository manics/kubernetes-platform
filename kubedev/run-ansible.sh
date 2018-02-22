#!/bin/bash
set -eu

export ANSIBLE_HOST_KEY_CHECKING=False
export TERRAFORM_STATE_ROOT="."
ANSIBLE_ARGS="-i ./inventory --become"
EXTRA_VARS=

if [ $# -gt 0 ]; then
    ansible-playbook $ANSIBLE_ARGS -e "$EXTRA_VARS" "$@"
else
    ansible-playbook $ANSIBLE_ARGS -e "$EXTRA_VARS" kubespray/cluster.yml kubespray/contrib/network-storage/glusterfs/glusterfs.yml
fi
