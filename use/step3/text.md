## Step 3: Create a Minimum Viable Helm Chart

In this step, we'll create a Helm chart to manage our Nginx service. We'll use the existing YAML files in `/root/spec` as a starting point for our Helm chart templates.

### Initialize Helm Chart

First, let's initialize a new Helm chart. This will create a new directory with the necessary files and structure.

```bash
helm create my-helm-chart
```{{exec}}

### Customize Helm Chart

Navigate to the `templates` directory inside your Helm chart folder.

```bash
cd my-helm-chart/templates
```{{exec}}

Now, replace the existing `deployment.yaml` and `service.yaml` with the ones from `/root/spec`.

```bash
cp /root/spec/deployment.yaml ./deployment.yaml
cp /root/spec/service.yaml ./service.yaml
cp /root/spec/pvc.yaml ./pvc.yaml
```{{exec}}

### Update values.yaml

Edit the `values.yaml` file in your Helm chart directory to match your specific needs. For example, you can specify the image and tag you want to use.

```bash
nano ../values.yaml
```{{exec}}

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
