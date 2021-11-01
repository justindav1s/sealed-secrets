#!/bin/bash

SERVER=https://api.sno.openshiftlabs.net:6443
NS=sealed-secrets
TOKEN=$(oc whoami -t)

oc get SealedSecretController sealed-secret-controller -n $NS -o json > resource.json

echo sleeping .....
sleep 60  

curl -k -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TOKEN" \
    -X PUT \
    --data-binary @resource.json \
    $SERVER/k8s/ns/$NS/bitnami.com~v1alpha1~SealedSecretController/sealed-secret-controller

 
kubectl get namespace $NS -o json > ns.json  

echo sleeping .....
sleep 60

curl -k -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TOKEN" \
    -X PUT \
    --data-binary @ns.json  \
    $SERVER/api/v1/namespaces/$NS/finalize