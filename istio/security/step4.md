### Based on kubernetes oob
Patch the recommendation service and switch over to **new** app selector

`./05-1_k8_blue_green.sh`{{execute}}


### Now based on Istio
Deploying the recommendation v2 with **same** app selector
`05-2_deploy_recommendationv2.sh`{{execute}}


Create the istio objects vs and dr
`05-3_blue_green_to_v2.sh`{{execute}}
`kubectl get vs -n tutorial`{{execute}}
`kubectl get dr -n tutorial`{{execute}}
