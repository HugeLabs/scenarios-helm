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

### Create values.yaml

Edit the 'values.yaml' file in your Helm chart directory to match your specific needs. For example, you can specify the image and tag you want to use.

```bash
cat << EOF > values.yaml
backgroundColor: "blue"
replicaCount: 3
port: 81
EOF
```{{exec}}

```bash
cat << EOF > Chart.yaml
apiVersion: v2
name: my-chart
version: 0.1.0
EOF
```{{exec}}


### Customize Helm Chart with variables

Update 'deployment.yaml' file to use the values from 'values.yaml'.

```bash
vi templates/deployment.yaml
```{{exec}}

```yaml
{{ .Values.replicaCount }}
```{{copy}}

Update 'configmap.yaml' file to use the values from 'values.yaml'.

```bash
vi templates/configmap.yaml
```{{exec}}

```yaml
{{ .Values.backgroundColor }}
```{{copy}}

Update 'service.yaml' file to use the values from 'values.yaml'.

```bash
vi templates/service.yaml
```{{exec}}

```yaml
{{ .Values.port }}
```{{copy}}


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
kubectl port-forward -n helm-demo --address 0.0.0.0 service/my-chart 81:81 &
```{{exec}}

Link to the service in the browser.

[{{TRAFFIC_HOST1_81}}]({{TRAFFIC_HOST1_81}})



### Access the Service

Finally, let's access the service to make sure everything is working as expected.

```bash
curl http://localhost:81
```{{exec}}


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