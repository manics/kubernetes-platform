#!/bin/bash
set -eu

CMD="$1"

TERRAFORM_STATE="terraform.tfstate"
TERRAFORM_VARFILE="kubedev.tfvars"
TERRAFORM_DIR="."

terraform version

if [ "$CMD" = init -o "$CMD" = get ]; then
    terraform "$CMD" "$TERRAFORM_DIR"
else
    terraform "$CMD" -state "$TERRAFORM_STATE" -var-file="$TERRAFORM_VARFILE" "$TERRAFORM_DIR"
fi
