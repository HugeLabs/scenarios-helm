## Step 3: Create a Minimum Viable Helm Chart

In this step, we'll create a Helm chart to manage our Nginx service. We'll use the existing YAML files in '/root/spec' as a starting point for our Helm chart templates.

### Initialize Helm Chart

First, let's create a new directory for our Helm chart and navigate into it.

```bash
mkdir demo-chart
```{{copy}}

### Create Chart Structure

Inside your Helm chart folder, create the following directories and files:

```bash
mkdir demo-chart/templates
```{{copy}}

### Copy YAML files

Copy the existing 'deployment.yaml', 'service.yaml', and 'pvc.yaml' files from '/root/spec' into the 'templates' directory.

```bash
cp /root/spec/deployment.yaml demo-chart/templates/deployment.yaml
cp /root/spec/service.yaml demo-chart/templates/service.yaml
cp /root/spec/configmap.yaml demo-chart/templates/configmap.yaml

```{{copy}}

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
```{{copy}}


## Customize the Chart

Update 'deployment.yaml' file to use the values from 'values.yaml'.

### deployment.yaml

Update 'deployment.yaml' file to use 'replicas' from 'values.yaml'.

```bash
vi demo-chart/templates/deployment.yaml
```{{copy}}

```yaml
{{ .Values.replicas }}
```{{copy}}


<details><summary></summary>

### configmap.yaml

Update 'configmap.yaml' file to use 'color' from 'values.yaml'.

```bash
vi demo-chart/templates/configmap.yaml
```{{copy}}

```yaml
{{ .Values.color }}
```{{copy}}

<details><summary></summary>

### service.yaml

Update 'service.yaml' file to use 'port' from 'values.yaml'.

```bash
vi demo-chart/templates/service.yaml
```{{copy}}

```yaml
{{ .Values.port }}
```{{copy}}

<details><summary></summary>

Put defaults for those values into values.yaml


```bash
cat << EOF > demo-chart/values.yaml
replicas: 1
color: teal
port: 81
EOF
```{{copy}}

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
kubectl create namespace helm-demo
```{{copy}}


```bash
helm install my-release demo-chart -n helm-demo
```{{copy}}

### Verify Deployment

Check that the Helm release is deployed and the service is running.

```bash
helm list -n helm-demo
```{{copy}}



```bash
kubectl get services -n helm-demo
```{{copy}}

Forward the port to access the service.

```bash
kubectl port-forward -n helm-demo --address 0.0.0.0 service/demo-service 81:81 &
```{{copy}}

Link to the service in the browser:

{{TRAFFIC_HOST1_81}}

### Access the Service

Finally, let's access the service to make sure everything is working as expected.

```bash
curl http://localhost:81
```{{copy}}

