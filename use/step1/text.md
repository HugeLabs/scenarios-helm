## Deploy a Service


Here is a basic service that we will later wrap in a helm chart.

<!-- Speaker script:
To start, we'll create a service from a YAML spec. This is a common way to deploy services in Kubernetes. We'll start with a very basic service to wrap in a helm chart. In this case, we'll deploy an Nginx container that will serve static content from a directory on the host, but you could just as easily deploy a containerized application.
-->

<details><summary></summary>

### create a namespace

Start by creating a namespace for the service.

<details><summary></summary>

```bash
kubectl create namespace demo
```{{exec}}


<details><summary></summary>

### Inspect the YAML spec

<!-- Speaker script:
Let's take a look at the YAML file that we'll be using to deploy the service. I've learned last year's conference that including cats in your presentation is well recieved with this crowd, so let's use the cat command here.
-->

View the YAML file that defines our service.

<details><summary></summary>

```bash
cat /root/catpics.yaml
```{{exec}}

<!-- Speaker script:
Here we have a PersistentVolumeClaim, a Deployment and a Service for this demo. The PersistentVolumeClaim consumes one of the PersistentVolumes that exists on the cluster. The Deployment creates a single replica of the Nginx container and will serve static content from that persistent volume. The Service exposes the Nginx container on port 80.
-->

<details><summary></summary>
### Deploy the YAML spec

<!-- Speaker script:
Now we deploy the service from the spec. We'll use the `kubectl apply` command to deploy it into the namespace we made. This will create the PersistentVolumeClaim, Deployment, and Service.  Applying this spec tells kubernetes that these items should exist in the cluster. If they already exist, it will update them to match the spec. If they don't exist, it will create them. Kubernetes will then start working to make sure that the cluster matches the spec.
-->

Deploy the service from the spec.

<details><summary></summary>

```bash
kubectl apply -f /root/catpics.yaml -n demo
```{{exec}}


<details><summary></summary>

### Check the service

<details><summary></summary>

```bash
kubectl get service -n demo
```{{exec}}

### Deploy content

The content for the service is stored in a persistent volume. We'll copy some content into the persistent volume.

```bash
# Find the name of the Nginx pod
POD_NAME=$(kubectl get pods -n demo -l app=nginx -o jsonpath="{.items[0].metadata.name}")
echo $POD_NAME
```{{exec}}


```bash
# Copy cat pictures into the pod
for f in /root/cats/*; do kubectl cp -n demo $f $POD_NAME:/usr/share/nginx/html/slideshow; done
```{{exec}}

```bash
kubectl cp -n demo /root/cats/ $POD_NAME:/usr/share/nginx/html/slideshow
```{{exec}}

## Expose the Service

Now, let's expose the service so that you can access it from your browser:

```bash
kubectl port-forward -n demo --address 0.0.0.0 service/nginx-service 80:80 &
```{{exec}}



<details><summary></summary>


Explore the service in your browser:

<details><summary></summary>
Check that nginx is running

[Welcome to NGINX]({{TRAFFIC_HOST1_80}})

<details><summary></summary>
View the "service"
[Cat Pics]({{TRAFFIC_HOST1_80}}/slideshow)

