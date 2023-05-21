#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

# Helm Setup
helm init --wait
helm repo update

# Setup dashboard on port 30000
# helm install stable/kubernetes-dashboard --name dash --set=service.type=NodePort \
# --set=enableInsecureLogin=true --set=service.nodePort=30000 \
# --set=service.externalPort=80 --namespace kube-system

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null

mkdir openfaas
cd openfaas

# Create Namespaces for OpenFaaS
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml

# Install helm chart for openfaas
helm repo add openfaas https://openfaas.github.io/faas-netes/

# generate a random password
export PASSWORD=$(head -c 12 /dev/urandom | shasum | cut --delimiter=' ' --fields=1)

# Create OpenFaaS secret to use with gateway
kubectl -n openfaas create secret generic basic-auth \
--from-literal=basic-auth-user=admin \
--from-literal=basic-auth-password="$PASSWORD"

# Install OpenFaaS
helm upgrade openfaas --install openfaas/openfaas --namespace openfaas --set functionNamespace=openfaas-fn \
--set basic_auth=true \
--set operator.create=false \
--set rbac=false \
--set faasIdler.dryRun=false \
--set faasIdler.inactivityDuration=10s

# Install private registry for images
helm install stable/docker-registry --name registry --namespace kube-system \
--set service.type=NodePort --set service.nodePort=31500

# Export Registry url
export REGISTRY=[[HOST_SUBDOMAIN]]-31500-[[KATACODA_HOST]].environments.katacoda.com

# install faas-cli
curl -sSL https://cli.openfaas.com | sh

export OPENFAAS_PORT=$(kubectl get service/gateway-external  -n openfaas -o 'jsonpath={.spec.ports[0].nodePort}')

export OPENFAAS_URL=https://[[HOST_SUBDOMAIN]]-$OPENFAAS_PORT-[[KATACODA_HOST]].environments.katacoda.com/

echo -n $PASSWORD | faas-cli login --username admin --password-stdin

# export TOKEN=$(kubectl describe secret $(kubectl get secret | awk '/^dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}')

echo OpenFaaS Gateway URL: $OPENFAAS_URL
echo Docker Private Registry URL: https://$REGISTRY/v2/_catalog
