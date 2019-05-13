"environment": {
  "showdashboard": true,
  "dashboards": [{"name": "Display 80", "port": 80}, {"name": "Display 8080", "port": 8080}],
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

kubectl port-forward svc/gateway -n openfaas 31112:8080 &
 

export OPENFAAS_URL=https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/

echo -n $PASSWORD | faas-cli login --password-stdin

kubectl patch service/kubernetes-dashboard -p '{"spec":{"type":"NodePort"}}' -n kube-system
