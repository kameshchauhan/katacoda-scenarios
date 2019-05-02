To start, launch the Kubernetes cluster. This will launch a two-node Kubernetes cluster with one master and one node.


### Check if minikube is running

`minikube status`{{execute}}

### Start the minikube 

`minikube start --memory=8192 --cpus=4 --kubernetes-version=v1.13.0`{{execute}}

It will take around 3-5 minutes. 

### Check the status of cluster by 

`minikube status`{{execute}}

#### Health Check

Once started, you can get the status of the cluster with `kubectl cluster-info`{{execute}}
