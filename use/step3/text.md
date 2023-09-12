### Minimum Viable Helm Chart

In this step, we'll create a Helm chart to manage our Nginx service. We'll use the existing YAML files in '/root/spec' as a starting point for our Helm chart templates.

<details><summary></summary>

### Create Helm Chart from Scratch

First, let's create a new directory for our Helm chart and navigate into it.

```bash
mkdir demo-chart
```{{exec}}

<details><summary></summary>

### Create Chart Structure

Inside your Helm chart folder, create the following directories and files:

```bash
mkdir demo-chart/templates
```{{exec}}

<details><summary></summary>

### Copy YAML files

Copy the existing 'deployment.yaml', 'service.yaml', and 'pvc.yaml' files from '/root/spec' into the 'templates' directory.

```bash
cp /root/spec/deployment.yaml demo-chart/templates/deployment.yaml
cp /root/spec/service.yaml demo-chart/templates/service.yaml
cp /root/spec/configmap.yaml demo-chart/templates/configmap.yaml

```{{exec}}

<details><summary></summary>

### Create Chart Metadata

Create a 'Chart.yaml' file for the Helm chart's metadata.

<!-- speaker script:
The Chart.yaml file contains metadata about the chart, including the name, version, and description. This is the minimum required metadata for a Helm chart.
-->

```bash
cat << EOF > demo-chart/Chart.yaml
apiVersion: v2
name: demo-chart
version: 0.1.0
EOF
```{{exec}}


## Customize the Chart

Update 'deployment.yaml' file to use the values from 'values.yaml'.

### deployment.yaml

Update 'deployment.yaml' file to use 'replicas' from 'values.yaml'.

```bash
vi demo-chart/templates/deployment.yaml
```{{exec}}

```yaml
{{ .Values.replicas }}
```{{copy}}


<details><summary></summary>

### configmap.yaml

Update 'configmap.yaml' file to use 'color' from 'values.yaml'.

```bash
vi demo-chart/templates/configmap.yaml
```{{exec}}

```yaml
{{ .Values.color }}
```{{copy}}

<details><summary></summary>

<!--
### service.yaml

Update 'service.yaml' file to use 'port' from 'values.yaml'.

```bash
vi demo-chart/templates/service.yaml
```{{exec}}

```yaml
{{ .Values.port }}
```{{copy}}

<details><summary></summary>
-->

Put defaults for those values into values.yaml


```bash
cat << EOF > demo-chart/values.yaml
replicas: 1
color: teal
EOF
```{{exec}}

<details><summary></summary>


That's it.

<!-- speaker script:
We've created a minimum viable Helm chart.
-->

<details><summary></summary>

### Deploy Helm Chart

Now that our Helm chart is ready, let's deploy it.

create a namespace for the service.

```bash
kubectl create namespace demo
```{{exec}}


```bash
helm install my-release demo-chart -n demo
```{{exec}}

<details><summary></summary>

### Verify Deployment

<!-- speaker script:
Did it work? Let's check.
-->


Check that the Helm release is deployed and the service is running.

```bash
helm list -n demo
```{{exec}}



```bash
kubectl get services -n demo
```{{exec}}


<details><summary></summary>

### View in browser

Forward the port to access the service.

```bash
kubectl port-forward -n demo --address 0.0.0.0 service/demo-service 8081:8081
```{{exec}}

Link to the service in the browser:

{{TRAFFIC_HOST1_8081}}
