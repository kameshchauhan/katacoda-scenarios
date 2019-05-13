#!/usr/bin/env bash
"environment": {
  "showdashboard": true
} 
mkdir openfaas
cd openfaas
export PATH=$PWD/bin:$PATH
minikube start --memory=8192 --cpus=4 --kubernetes-version=v1.13.0
minikube addons enable dashboard

git clone https://github.com/openfaas/faas-netes

kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml

# generate a random password
export PASSWORD="admin"

kubectl -n openfaas create secret generic basic-auth \
--from-literal=basic-auth-user=admin \
--from-literal=basic-auth-password="$PASSWORD"

cd faas-netes && kubectl apply -f ./yaml

kubectl patch service/gateway -p '{"spec":{"type":"NodePort"}}' -n openfaas

export OPENFAAS_PORT=$(kubectl get service/gateway  -n openfaas -o 'jsonpath={.spec.ports[0].nodePort}')

export OPENFAAS_URL=https://[[HOST_SUBDOMAIN]]-$OPENFAAS_PORT-[[KATACODA_HOST]].environments.katacoda.com/

# install faas-cli
curl -sL cli.openfaas.com | sudo sh

echo -n $PASSWORD | faas-cli login --password-stdin

# Patch the k8s dashboard
kubectl patch service/kubernetes-dashboard -p '{"spec":{"type":"NodePort"}}' -n kube-system

echo -n $PASSWORD | faas-cli login -g http://$OPENFAAS_URL -u admin —password-stdin