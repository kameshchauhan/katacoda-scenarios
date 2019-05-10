Download & Install Istio CRDs



### Create a namespace for the istio-system components:


`kubectl create namespace istio-system`{{execute}}


Install all the Istio Custom Resource Definitions (CRDs) using kubectl apply, and wait a few seconds for the CRDs to be committed in the Kubernetes API-server:


`for i in install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done`{{execute}}


Verify that all 53 Istio CRDs were committed to the Kubernetes api-server using the following command:


 If cert-manager is enabled, then the CRD count will be 58 instead.
`kubectl get crds | grep 'istio.io\|certmanager.k8s.io' | wc -l`{{execute}}


Install demo profile of istio
`kubectl apply -f install/kubernetes/istio-demo.yaml`{{execute}}

`/root/istio/istio-1.1.3/install/kubernetes/istio-demo.yaml`{{open}}

Ensure the following Kubernetes services are deployed and verify they all have an appropriate CLUSTER-IP except the jaeger-agent service:


`kubectl get svc -n istio-system`{{execute}}


Ensure corresponding Kubernetes pods are deployed and have a STATUS of Running:


`kubectl get pods -n istio-system`{{execute}}


