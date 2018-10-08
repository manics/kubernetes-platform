#!/bin/bash
set -eu

if [ "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" != "$PWD" ]; then
    echo Must be run from script parent directory
    exit 2
fi

virtualenv venv
. venv/bin/activate
pip install 'ansible<2.7'
pip install -r kubespray/requirements.txt

ansible-playbook -i inventory/ kubespray/cluster.yml --become
