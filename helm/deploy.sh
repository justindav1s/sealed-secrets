#!/bin/bash

cd helm

helm package sealed-secrets-ocp311
helm repo index .

git add ..

git commit -m "chart update"

git push

helm repo remove jd_sealed_secrets

helm repo add jd_repos https://gitlab.com/demoplatform/helmcharts/-/raw/main/charts/

helm repo update

curl https://gitlab.com/demoplatform/helmcharts/-/raw/main/charts/index.yaml

helm search repo jd_repos

cd -