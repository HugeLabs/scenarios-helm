### Customize the service

Time to iterate!

Let's make some changes to the installed service.

<details><summary></summary>

### Modify the Helm Chart

<!-- speaker script:
Now that we have a Helm chart, we can modify it to customize the service. We can modify the Helm chart by changing the values in the `values.yaml` file or the code in the `templates` directory. here we will change the number of replicas in the deployment.
-->

We will change the number of replicas in the deployment by changing the value in the `values.yaml` file.

<details><summary></summary>

#### How many replicas?

Observe the initial number of replicas in the deployment.

```bash
kubectl get pods -n demo
```{{exec}}

<details><summary></summary>

#### Modify values.yaml

<!-- speaker script:
Let's make a change. -->

Change the number of replicas to 3 by modifying the `values.yaml` file.

```bash
vi demo-chart/values.yaml
```{{exec}}

Apply the changes by upgrading the release.

```bash
helm upgrade my-release demo-chart -n demo
```{{exec}}

<details><summary></summary>

#### Check result

Check for new pods.

```bash
kubectl get pods -n demo
```{{exec}}

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
helm upgrade my-release demo-chart -n demo --set replicas=5
```{{exec}}

<details><summary></summary>

#### Check result

<!-- speaker script:
Notice that the number of replicas changed.
-->

Check that the number of replicas changed.

```bash
kubectl get pods -n demo
```{{exec}}

<details><summary></summary>


### Changing the content

Lets have another look at our web page before we continue.

```bash
kubectl port-forward -n demo --address 0.0.0.0 service/demo-service 81:81
```{{exec}}

{{TRAFFIC_HOST1_81}}

<details><summary></summary>


<!-- speaker script:
Let's change the color of the page by overriding the color when we deploy the chart.
-->

Let's change the color.

```bash
helm upgrade my-release demo-chart -n demo --set color=yellow
```{{exec}}

<details><summary></summary>

### Verify the change

Refresh the page in the browser to see the new color.

```bash
kubectl port-forward -n demo --address 0.0.0.0 service/demo-service 81:81
```{{exec}}

{{TRAFFIC_HOST1_81}}

<details><summary></summary>

### Uh-oh

why is the color not changing?

<!-- speaker script:
The reason the color is not changing is because the deployment is not being updated. The deployment is not being updated because nothing in the deployment changed. The deployment is not being updated because the color is not part of the deployment. The color is part of the configmap.
-->

<details><summary></summary>

#### Deployment did not change

The content is in the configmap and not the deployment. Nothing changed in the deployment.

To get the change to apply, we need to restart the pods.

<details><summary></summary>

#### "restarting"

In kubernetes, 'restart' is a euphemism for killing. The pods will be replaced automatically.

we can kill the pods and when they restart they will pick up the new configmap.

<details><summary></summary>

#### Annotation

But we can do better than that and automate this so that the pods are restarted automatically when the configmap changes.

We'll calculate a checksum of the configmap and add it to the deployment as an annotation. The deployment controller will see the change and restart the pods.

<details><summary></summary>

### Making the annotation

Here is the code that calculates the checksum:

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

<details><summary></summary>

#### Put it in the deployment

For convenience, here is just the annotations section so we can paste it in.

```text
      annotations:
        checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
```{{copy}}



```bash
vi ~/demo-chart/templates/deployment.yaml
```{{exec}}




```bash
helm upgrade my-release demo-chart -n demo --set color=yellow
```{{exec}}

<details><summary></summary>

#### Check result

Now the pods will be restarted automatically when the configmap changes.



```bash
kubectl get pods -n demo
```{{exec}}

and the page will be yellow.

```bash
kubectl port-forward -n demo --address 0.0.0.0 service/demo-service 81:81
```{{exec}}

#### Review the page

{{TRAFFIC_HOST1_81}}

<details><summary></summary>

### Changing the content

We can also change the content of the page by changing the configmap, and the pods will be restarted automatically.

```bash
vi ~/demo-chart/templates/configmap.yaml
```{{exec}}

```text
@_
```{{copy}}


```bash
helm upgrade my-release demo-chart -n demo --set color=lightblue
```{{exec}}

<details><summary></summary>

### View the result

```bash
kubectl port-forward -n demo --address 0.0.0.0 service/demo-service 81:81
```{{exec}}

{{TRAFFIC_HOST1_81}}

