kubectl get po -n monitoring -l app=prometheus |awk '$3=="Running"{system ("kubectl port-forward -n monitoring "$1" 9090:9090" )}' &
kubectl port-forward svc/tracing 9411:9411 -n istio-system &
kubectl port-forward svc/kiali 20001:20001 -n istio-system &

