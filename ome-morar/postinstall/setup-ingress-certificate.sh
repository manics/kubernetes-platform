#!/bin/sh
# Create the https certificate secret required by nginx-ingress
set -eu

if [ ! -f PRIVATE.key -o ! -f CERTIFICATE.crt+bundle ]; then
    echo "ERROR: PRIVATE.key and CERTIFICATE.crt+bundle required, e.g."
    echo "pass show ssl.key > PRIVATE.key"
    echo "pass show ssl.crt+bundle > CERTIFICATE.crt+bundle"
    exit 1
fi
kubectl create --namespace=kube-system secret tls star-openmicroscopy-org --key PRIVATE.key --cert CERTIFICATE.crt+bundle
