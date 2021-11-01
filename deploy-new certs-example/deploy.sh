#!/bin/bash


APP=seled-secrets
DOMAIN=example.com
DATE=$(date '+%H%M%S-%d%m%Y')
rm -rf ${DOMAIN}*

openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -subj '/O=Sealed Secrets/CN=example.com' -keyout example.com.key.pem -out example.com.crt.pem

oc create secret tls sealed-secret-cert-${DATE} \
     --cert=example.com.crt.pem \
     --key=example.com.key.pem \
     --dry-run=client \
     -o yaml \
     -n sealed-secrets \
     > sealed-secret-cert-${DATE}.yaml


oc apply -f sealed-secret-cert-${DATE}.yaml

oc label secret sealed-secret-cert-${DATE} sealedsecrets.bitnami.com/sealed-secrets-key=active -n sealed-secrets