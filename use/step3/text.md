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


### Deploy Helm Chart

Now that our Helm chart is ready, let's deploy it.

```bash
helm install my-helm-release .
```{{exec}}

### Verify Deployment

Check that the Helm release is deployed and the service is running.

```bash
helm list
kubectl get services
```{{exec}}

### Access the Service

Finally, let's access the service to make sure everything is working as expected.

```bash
curl <SERVICE_IP>
```{{exec}}
