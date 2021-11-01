#!/bin/bash

kubeseal --fetch-cert \
      --format yaml \
      --controller-name sealed-secret-controller-sealed-secrets \
      --controller-namespace sealed-secrets > cert.pem