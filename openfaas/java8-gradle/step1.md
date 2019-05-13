To start, launch the Kubernetes cluster. This will launch a two-node Kubernetes cluster with one master and one node.


### Check if minikube is running


`minikube status`{{execute}}

### Check the status of cluster by 


`minikube status`{{execute}}


#### Health Check


Once started, you can get the status of the cluster with `kubectl cluster-info`{{execute}}




Kubernetes has a web-based dashboard UI giving visibility into the Kubernetes cluster.


## Task


Enable the kubernetes dashboard 
`minikube addons enable dashboard`


Patch the dashboard service
`kubectl patch service/kubernetes-dashboard -p '{"spec":{"type":"NodePort"}}' -n kube-system`{{execute}}


Check the port of the dashboard:
`kubectl get svc kubernetes-dashboard -n kube-system -o 'jsonpath={.spec.ports[0].nodePort}'`{{execute}}


See kuberenetes dashboard at https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/

