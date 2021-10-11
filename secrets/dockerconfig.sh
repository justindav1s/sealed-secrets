#!/bin/bash

PROJECT=sealedsecretstest

rm -rf docker-* secret-* sealed-*
oc delete secret secret-tiger-docker -n $PROJECT


oc create secret docker-registry secret-tiger-docker \
  --docker-username=tiger \
  --docker-password=pass113 \
  --docker-email=tiger@acme.com \
  --docker-server=my-registry.example:5000 -o yaml --dry-run=client > docker-creds.yaml

oc apply -f docker-creds.yaml -n sealedsecretstest

oc annotate secret secret-tiger-docker sealedsecrets.bitnami.com/managed="true" -n $PROJECT

oc get secret secret-tiger-docker -o yaml -n $PROJECT > docker-creds.yaml

cat docker-creds.yaml | kubeseal --cert cert.pem \
        --format yaml \
        > sealed-docker-creds.yaml

oc delete secret secret-tiger-docker -n $PROJECT

oc apply -f sealed-docker-creds.yaml -n $PROJECT