#!/bin/bash
set -eu

CMD="$1"
shift

TERRAFORM_STATE="terraform.tfstate"
TERRAFORM_VARFILE="kubedev.tfvars"
TERRAFORM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

terraform version

cd kubespray

if [ "$CMD" = init -o "$CMD" = get ]; then
    terraform "$CMD" "$TERRAFORM_DIR" "$@"
else
    terraform "$CMD" -state "$TERRAFORM_DIR/$TERRAFORM_STATE" -var-file="$TERRAFORM_DIR/$TERRAFORM_VARFILE" "$TERRAFORM_DIR" "$@"
fi
