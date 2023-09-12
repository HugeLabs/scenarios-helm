## Customize the service

Let's make some changes to the installed service.

### Modify the Helm Chart

<!-- speaker script:
Now that we have a Helm chart, we can modify it to customize the service. We can modify the Helm chart by changing the values in the `values.yaml` file or the code in the `templates` directory. here we will change the number of replicas in the deployment.
-->

We will change the number of replicas in the deployment by changing the value in the `values.yaml` file.

```bash

<details><summary></summary>

Observe the initial number of replicas in the deployment.

```bash
kubectl get pods -n helm-demo
```{{copy}}

<details><summary></summary>

Change the number of replicas by modifying the `values.yaml` file.

```bash
vi values.yaml
```{{copy}}

<details><summary></summary>

Apply the changes to the Helm chart.

```bash
helm upgrade my-release my-chart -n helm-demo
```{{copy}}

<details><summary></summary>

Check for new pods.

```bash
kubectl get pods -n helm-demo
```{{copy}}

<!-- speaker script:
Notice that the number of replicas changed. This is because we changed the number of replicas in the deployment. Helm updated the deployment in place.
-->

<details><summary></summary>

### Deploy with custom values

<!-- speaker script:
Another way to customize the Helm chart is to override the values in the `values.yaml` file when we deploy the chart. This is useful when we want to deploy the same chart multiple times with different values.
-->

We can override the values in the `values.yaml` file at the command line when we deploy the chart.

```bash
helm install my-release my-chart --set replicas=2 -n helm-demo
```{{copy}}

<details><summary></summary>

Check that the number of replicas changed.

```bash
kubectl get pods -n helm-demo
```{{copy}}

<details><summary></summary>

### change the color

<!-- speaker script:
Let's change the color of the service by overriding the value in the `values.yaml` file when we deploy the chart.
-->

```bash
helm install my-release my-chart --set color=yellow -n helm-demo
```{{copy}}







```bash
helm upgrade my-release my-chart --set color=yellow -n helm-demo
```{{copy}}

