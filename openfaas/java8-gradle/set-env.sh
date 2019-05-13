"environment": {
  "showdashboard": true,
  "dashboards": [{"name": "Display 80", "port": 80}, {"name": "Display 8080", "port": 8080}],
} 
mkdir openfaas
cd openfaas
export PATH=$PWD/bin:$PATH
minikube start --memory=8192 --cpus=4 --kubernetes-version=v1.13.0
minikube addons enable dashboard

