## Customize the service

### Upgrade the Helm Chart

```bash
kubectl get pods -n helm-demo
```{{exec}}

Upgrade the Helm chart to change the number of replicas to 5.

```bash
helm upgrade my-release my-chart --set replicaCount=5 -n helm-demo
```{{exec}}

let's see the new pods

```bash
kubectl get pods -n helm-demo
```{{exec}}

### change color

```bash
helm upgrade my-release my-chart --set backgroundColor=yellow -n helm-demo
```{{exec}}

