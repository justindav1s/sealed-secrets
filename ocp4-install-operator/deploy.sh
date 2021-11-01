#!/bin/bash

PROJECT=sealed-secrets

oc delete sealedsecretcontroller sealed-secret-controller -n $PROJECT
oc delete crd sealedsecretcontrollers.bitnami.com -n $PROJECT
oc delete crd sealedsecrets.bitnami.com -n $PROJECT
oc delete ClusterRole secrets-unsealer
oc delete ClusterRoleBinding sealed-secret-controller-sealed-secrets

oc delete project $PROJECT
oc new-project $PROJECT 2> /dev/null
while [ $? \> 0 ]; do
    sleep 1
    printf "."
oc new-project $PROJECT 2> /dev/null
done

oc apply -f operator-group.yaml -n $PROJECT
oc apply -f subscription.yaml -n $PROJECT

sleep 15

PLAN=$(oc get installplan | grep sealed-secrets-operator | cut -d' ' -f 1)

echo PLAN $PLAN

oc -n $PROJECT patch installplan $PLAN -p '{"spec":{"approved":true}}' --type merge

oc get installplan $PLAN -n $PROJECT

sleep 10

oc apply -f controller.yaml