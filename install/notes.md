##CLI install of Operator

Best to use this as more automatic and GitOps compliant.

https://docs.openshift.com/container-platform/4.8/operators/admin/olm-adding-operators-to-cluster.html

https://github.com/disposab1e/sealed-secrets-operator-helm/blob/release-0.0.2/helm-charts/sealed-secrets/README.md

oc get packagemanifests -n openshift-marketplace  | grep secrets

sealed-secrets-operator-helm                         Community Operators   23d

oc describe packagemanifests sealed-secrets-operator-helm -n openshift-marketplace

```
Name:         sealed-secrets-operator-helm
Namespace:    openshift-marketplace
Labels:       catalog=community-operators
              catalog-namespace=openshift-marketplace
              operatorframework.io/arch.amd64=supported
              operatorframework.io/os.linux=supported
              provider=Disposable Zone
              provider-url=
Annotations:  <none>
API Version:  packages.operators.coreos.com/v1
Kind:         PackageManifest
Metadata:
  Creation Timestamp:  2021-09-17T09:53:06Z
Spec:
Status:
  Catalog Source:               community-operators
  Catalog Source Display Name:  Community Operators
  Catalog Source Namespace:     openshift-marketplace
  Catalog Source Publisher:     Red Hat
  Channels:
    Current CSV:  sealed-secrets-operator-helm.v0.0.2
    Current CSV Desc:
      Annotations:
        Alm - Examples:  [
  {
    "apiVersion": "bitnami.com/v1alpha1",
    "kind": "SealedSecretController",
    "metadata": {
      "name": "SealedSecretController"
    },
    "spec": {
      "image": {
        "repository": "quay.io/bitnami/sealed-secrets-controller@sha256:8e9a37bb2e1a6f3a8bee949e3af0e9dab0d7dca618f1a63048dc541b5d554985",
        "pullPolicy": "IfNotPresent"
      },
      "resources": {
      },
      "nodeSelector": {
      },
      "tolerations": [

      ],
      "affinity": {
      },
      "controller": {
        "create": true
      },
      "serviceAccount": {
        "create": true,
        "name": ""
      },
      "rbac": {
        "create": true,
        "pspEnabled": false
      },
      "secretName": "sealed-secrets-key",
      "ingress": {
        "enabled": false,
        "annotations": {
        },
        "path": "/v1/cert.pem",
        "hosts": [
          "chart-example.local"
        ],
        "tls": [

        ]
      },
      "crd": {
        "create": true,
        "keep": true
      },
      "networkPolicy": false,
      "securityContext": {
        "runAsUser": "",
        "fsGroup": ""
      },
      "podAnnotations": {
      },
      "podLabels": {
      },
      "priorityClassName": ""
    }
  }
]
        Capabilities:                              Basic Install
        Categories:                                Security
        Certified:                                 false
        Container Image:                           quay.io/disposab1e/sealed-secrets-operator-helm@sha256:d07a66107243a0054a54aac7cd71c0a8a342c4cd45c6609ec2ab6470df16f09c
        Created At:                                2020-07-08 01:01:01
        Description:                               A Kubernetes controller and tool for one-way encrypted Secrets.
        olm.properties:                            [{"type": "olm.maxOpenShiftVersion", "value": "4.8"}]
        operatorframework.io/suggested-namespace:  sealed-secrets
        Repository:                                https://github.com/disposab1e/sealed-secrets-operator-helm.git
        Support:                                   Community
      Apiservicedefinitions:
      Customresourcedefinitions:
        Owned:
          Description:   Represents the Sealed Secret Controller installation.
          Display Name:  SealedSecretController
          Kind:          SealedSecretController
          Name:          sealedsecretcontrollers.bitnami.com
          Version:       v1alpha1
      Description:       
[Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) is a Kubernetes controller and tool for one-way encrypted Secrets.

### Overview

This **community maintained** [Sealed Secrets Operator (Helm)](https://github.com/disposab1e/sealed-secrets-operator-helm) is based on the **community maintained** [Sealed Secrets Helm Chart](https://hub.kubeapps.com/charts/stable/sealed-secrets) and installs [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) in OpenShift Container Platform.


### Features

* Easy configuration and installation

### Install

The operator shares all [configuration values](https://github.com/disposab1e/sealed-secrets-operator-helm/blob/release-0.0.2/helm-charts/sealed-secrets/README.md) 
from the Sealed Secrets Helm Chart and manages a single namespace installation of Sealed Secrets. 
Therefore you have to install the operator and Sealed Secrets in the same namespace. 
For simplicity we recommend creating a namespace **sealed-secrets**. 

To install Sealed Secrets create a new [SealedSecretController resource](https://github.com/disposab1e/sealed-secrets-operator-helm/blob/release-0.0.2/examples/ocp.yaml) 
with your own customizations or use the provided example from the Web UI.

### kubeseal

Install the kubeseal command line interface by downloading the binary from Sealed Secrets [releases](https://github.com/bitnami-labs/sealed-secrets/releases) and read about kubeseal usage on Sealed Secrets [docs](https://github.com/bitnami-labs/sealed-secrets#usage).

### Documentation

See the [documentation](https://sealed-secrets-operator-helm.readthedocs.io/en/0.0.2/) 
and [examples](https://github.com/disposab1e/sealed-secrets-operator-helm/blob/release-0.0.2/examples/) 
or visit the [official github repository](https://github.com/disposab1e/sealed-secrets-operator-helm) for more information.

      Display Name:  Sealed Secrets Operator (Helm)
      Install Modes:
        Supported:  true
        Type:       OwnNamespace
        Supported:  true
        Type:       SingleNamespace
        Supported:  false
        Type:       MultiNamespace
        Supported:  false
        Type:       AllNamespaces
      Links:
        Name:  Sealed Secrets
        URL:   https://github.com/bitnami-labs/sealed-secrets/
        Name:  GitHub
        URL:   https://github.com/disposab1e/sealed-secrets-operator-helm.git
        Name:  Read the Docs
        URL:   https://sealed-secrets-operator-helm.rtfd.io
      Maintainers:
        Email:   disposable.source@icloud.com
        Name:    Disposable Zone
      Maturity:  alpha
      Provider:
        Name:  Disposable Zone
      Related Images:
        quay.io/disposab1e/sealed-secrets-operator-helm@sha256:d07a66107243a0054a54aac7cd71c0a8a342c4cd45c6609ec2ab6470df16f09c
      Version:      0.0.2
    Name:           alpha
  Default Channel:  alpha
  Package Name:     sealed-secrets-operator-helm
  Provider:
    Name:  Disposable Zone
Events:    <none>
```

