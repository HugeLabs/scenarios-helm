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

Change the number of replicas to 5 by modifying the `values.yaml` file.

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




### Changing the content

Lets have another look at our web page before we continue.

first we'll ensure that our port-forward is still running.

```bash
jobs
```{{copy}}

if not, we can restart it.

```bash
kubectl port-forward -n helm-demo --address 0.0.0.0 service/demo-chart 81:81 &
```{{copy}}

Now we can refresh the page in the browser.

[the page]({{TRAFFIC_HOST1_81}})

<details><summary></summary>


<!-- speaker script:
Let's change the color of the page by overriding the color when we deploy the chart.
-->

Let's change the color.

```bash
helm upgrade my-release my-chart --set color=teal -n helm-demo
```{{copy}}





```bash
helm install my-release my-chart --set color=yellow -n helm-demo
```{{copy}}

### verify the change

Refresh the page in the browser to see the new color.

[the page]({{TRAFFIC_HOST1_81}})

<details><summary></summary>

### uh-oh

why is the color not changing?

<!-- speaker script:
The reason the color is not changing is because the deployment is not being updated. The deployment is not being updated because nothing in the deployment changed. The deployment is not being updated because the color is not part of the deployment. The color is part of the configmap.
-->

<details><summary></summary>

The content is in the configmap and not the deployment. Nothing changed in the deployment.

To get the change to apply, we need to restart the pods.

In kubernetes, 'restart' is a euphemism for killing. The pods will be replaced automatically.

we can kill the pods one-at-a-time like this:


<details><summary></summary>

Choose one of the pods.

```bash
kubectl get pods -n helm-demo
```{{copy}}

Kill the pod.

```bash
kubectl delete pod <pod-name> -n helm-demo
```{{copy}}

<details><summary></summary>

Or we can use the deployment to kill the pods.

```bash
kubectl rollout restart deployment/demo-chart -n helm-demo
```{{copy}}

What this does is change an annotation in the deployment with a timestamp. The deployment controller sees the change and kills the pods one-at-a-time. The pods are replaced automatically.

<details><summary></summary>

But we can do a little better and automate this so that the pods are restarted automatically when the configmap changes.

We'll calculate a checksum of the configmap and add it to the deployment as an annotation. The deployment controller will see the change and restart the pods.

```bash
shasum -a 256 templates/configmap.yaml
```{{copy}}

<details><summary></summary>

This calculates a checksum of the configmap.

```text
{{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
```{{copy}}

We can add the checksum to the deployment like in this location:


```text
spec:
  template:
    metadata:
      annotations:
        checksum/config:
```

for convenience, here's just the annotations section so we can paste it in.

```text
      annotations:
        checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
```{{copy}}

```text
{{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
```{{copy}}


```bash
vi templates/deployment.yaml
```{{copy}}




```bash
helm upgrade my-release my-chart --set color=yellow -n helm-demo
```{{copy}}

