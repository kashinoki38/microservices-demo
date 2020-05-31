kubectl get po -n monitoring -l app=prometheus |awk '$3=="Running"{system ("kubectl port-forward -n monitoring "$1" 9090:9090" )}'
