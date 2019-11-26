# Prometheus-Operator

This directory contains manifests to demonstrate how sock-shop microservices can be monotired either by the `prometheus-k8s` instances runnin in the `monitoring` namespace, or by a dedicated prometheus deployed in the `sock-shop` namespace. 

## Sock-Shop Deployment

Run the following command line to deploy the [sock-shop microservices-demo](https://microservices-demo.github.io).

```bash
kubectl apply -f deploy/kubernetes/manifests/
```

> This command deploys the sock-shop website in the sock-shop namespace and also a [locust](https://locust.io) load-testing tool to simulate client trafic.

### Validation (Kubernetes)

Use the following command-line to expose the `front-end` microservice.

```bash
kubectl -n sock-shop port-forward svc/front-end 8123:80
```

### Openshift

```bash
<command to retreive the sock-shop endpoint>
```

## Deploy the ServiceMonitors

```bash
kubectl apply -f deploy/kubernetes/manifests-prometheus-operator/
```

### Prometheus-Operator scraping configuration

To let the `prometheus-k8s` instance running in the `monitoring` to collect metrics from microservices localted in the `sock-shop` namespace. It is simply required to push the appropriate [RBAC](./00_prometheus-k8s-crb.yaml) configuraiton to allow the `prometheus-k8s` service account access the ServiceMonitor CRDs.

```text
+--------------------+     +---------------------+
| ns: monitoring     |  +->| ns: sock-shop       |
+--------------------+  |  +----------  ---------+
| po: prometheus-k8s |--+  | svc: app=carts      |
+--------------------+     + ---------  ---------+
                           | pod: app=carts      |
                           +---------------------+
```

Use the following command-line to configure the RBAC for prometheus-operator/kube-prometheus.

```bash
kubectl apply -f deploy/kubernetes/manifests-prometheus-operator/00_prometheus-k8s-crb.yaml
```

Open a session in the prometheus instance to see if new monitoring targets are initialized.

```bash
kubectl -n monitoring port-forward svc/promehteus-operated 29090:9090
```

* <http://localhost:29090/targets>
* <http://localhost:29090/service-discovery>

### Internal Prometheus scraping configuration

If you do not wand to push all microservices metrics directly to the `prometheus-k8s` instance, a good alternative is to deploy a local prometheus instance with the help of the [prometheus-operator]().

```text
+-------------------------+     +---------------------------+
| ns: monitoring          |     | ns: sock-shop             |
+-------------------------+     +---------------------------+
| po: prometheus-operator |--+  | svc: app=carts            |<-+
+-------------------------+  |  +-------------  ------------+  |
                             |  | pod: app=carts            |  |
                             |  +---------------------------+  |
                             +->| sts: prometheus=sock-shop |--+
                                +---------------------------+
```

Use the following command-line to deploy the prometheus instance in the `sock-shop` namespace with the appropriate [RBAC](./prometheus-local/).

```bash
kubectl apply -f deploy/kubernetes/manifests-prometheus-operator/prometheus-local/sock-shop-prometheus.yaml
```

Open a session in the prometheus instance to see if new monitoring targets are initialized.

```bash
kubectl -n sock-shop port-forward svc/promehteus-operated 19090:9090
```

* <http://localhost:19090/targets>
* <http://localhost:19090/service-discovery>