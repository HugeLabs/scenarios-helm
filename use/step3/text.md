## Step 3: Create a Minimum Viable Helm Chart

In this step, we'll create a Helm chart to manage our Nginx service. We'll use the existing YAML files in '/root/spec' as a starting point for our Helm chart templates.

### Initialize Helm Chart

First, let's create a new directory for our Helm chart and navigate into it.

```bash
mkdir my-helm-chart
cd my-helm-chart
```{{exec}}

### Create Chart Structure

Inside your Helm chart folder, create the following directories and files:

```bash
mkdir templates
```{{exec}}

### Customize Helm Chart

Copy the existing 'deployment.yaml', 'service.yaml', and 'pvc.yaml' files from '/root/spec' into the 'templates' directory.

```bash
cp /root/spec/deployment.yaml templates/deployment.yaml
cp /root/spec/service.yaml templates/service.yaml
cp /root/spec/configmap.yaml templates/configmap.yaml

```{{exec}}

### Create Chart Metadata

Create a 'Chart.yaml' file for the Helm chart's metadata.

<!-- speaker script:
The Chart.yaml file contains metadata about the chart, including the name, version, and description. This is the minimum required metadata for a Helm chart.
-->

```bash
cat << EOF > Chart.yaml
apiVersion: v2
name: my-chart
version: 0.1.0
EOF
```{{exec}}


### Customize Helm Chart with variables

Update 'deployment.yaml' file to use the values from 'values.yaml'.

```yaml
{{ .Values.replicas }}
```{{copy}}

```bash
vi templates/deployment.yaml
```{{exec}}

```yaml
{{ .Values.color }}
```{{copy}}

Update 'configmap.yaml' file to use the values from 'values.yaml'.

```bash
vi templates/configmap.yaml
```{{exec}}

Update 'service.yaml' file to use the values from 'values.yaml'.

```yaml
{{ .Values.port }}
```{{copy}}

```bash
vi templates/service.yaml
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
kubectl create namespace helm-demo
```{{exec}}


```bash
helm install my-release . -n helm-demo
```{{exec}}

### Verify Deployment

Check that the Helm release is deployed and the service is running.

```bash
helm list -n helm-demo
```{{exec}}



```bash
kubectl get services -n helm-demo
```{{exec}}

Forward the port to access the service.

```bash
kubectl port-forward -n helm-demo --address 0.0.0.0 service/demo-chart 81:81 &
```{{exec}}

Link to the service in the browser.

{{TRAFFIC_HOST1_81}}

[a link to the thing]({{TRAFFIC_HOST1_81}})



### Access the Service

Finally, let's access the service to make sure everything is working as expected.

```bash
curl http://localhost:81
```{{exec}}

