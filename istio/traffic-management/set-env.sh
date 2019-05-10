"environment": {
  "showdashboard": true,
  "dashboards": [{"name": "Display 80", "port": 80}, {"name": "Display 8080", "port": 8080}],
} 
export ISTIO_VERSION="1.1.3" 
mkdir istio 
cd istio 
curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.1.3 sh - 
export ISTIO_HOME=/istio/istio-1.1.3 
export NAMESPACE="istio" 
cd /root/istio/istio-1.1.3 
export PATH=$PWD/bin:$PATH
minikube start --memory=8192 --cpus=4 --kubernetes-version=v1.13.0`{{execute}} 
 
 
 