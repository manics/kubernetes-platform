#!/bin/bash
set -eu

TERRAFORM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export ANSIBLE_HOST_KEY_CHECKING=False
export TERRAFORM_STATE_ROOT="$TERRAFORM_DIR"
ANSIBLE_ARGS="-i $TERRAFORM_DIR/inventory --become"
EXTRA_VARS=

#cd kubespray

if [ $# -gt 0 ]; then
    ansible-playbook $ANSIBLE_ARGS -e "$EXTRA_VARS" "$@"
else
    ansible-playbook $ANSIBLE_ARGS -e "$EXTRA_VARS" kubespray/cluster.yml kubespray/contrib/network-storage/glusterfs/glusterfs.yml
fi
