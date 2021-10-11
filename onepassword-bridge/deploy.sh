#!/bin/bash

PROJECT=sealedsecretstest

# cleanup
oc delete Secret secure-note1 -n $PROJECT
oc delete OnePasswordItem secure-note1 -n $PROJECT

# setup the onePassword secret
oc apply -f securenote.yaml -n $PROJECT
oc get secrets secure-note1 -n $PROJECT

# extract the raw onePassword secret
oc get secrets secure-note1 -o yaml -n $PROJECT > secure-note1.yaml

# seal onePassword secret with kubeseal
cat secure-note1.yaml | kubeseal --cert ../cert.pem \
        --format yaml \
        > sealed-secure-note1.yaml

# delete onePassword secret
oc delete Secret secure-note1 -n $PROJECT
oc delete OnePasswordItem secure-note1 -n $PROJECT

#apply Sealed Secret
oc apply -f sealed-secure-note1.yaml -n $PROJECT
oc get secrets secure-note1 -n $PROJECT