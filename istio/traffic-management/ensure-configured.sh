kubectl patch service/kubernetes-dashboard -p '{"spec":{"type":"NodePort"}}' -n kube-system


