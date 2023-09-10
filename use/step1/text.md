## Create the service from a YAML spec
<!-- Speaker script:
To start, we'll create a service from a YAML spec. This is a common way to deploy services in Kubernetes. We'll start with a very basic service to wrap in a helm chart. In this case, we'll deploy an Nginx container that will serve static content from a directory on the host, but you could just as easily deploy a containerized application.
-->

We will start with a very basic service to wrap in a helm chart.

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
Now we deploy the service from the spec. We'll use the `kubectl apply` command to create the service. This will create the PersistentVolumeClaim and the Deployment.
-->

```bash
kubectl apply -f /root/catpics.yaml
```{{exec}}

This will create a PersistentVolumeClaim and a Deployment for our Nginx service.

<details><summary></summary>
check

#### Check that the service is listening


```bash
curl localhost:80
```{{exec}}


### Copy Cat Pictures

Next, let's copy some cat pictures into the Nginx container. For the sake of this demo, assume that the cat pictures have already been downloaded to a directory on the host.



```bash
# Find the name of the Nginx pod
POD_NAME=$(kubectl get pods -l app=nginx -o jsonpath="{.items[0].metadata.name}")
```{{exec}}

```bash
# Copy cat pictures into the pod
kubectl cp /root/cats/* $POD_NAME:/usr/share/nginx/html/slideshow
```{{exec}}

## Expose the Service

Now, let's expose the service so that you can access it from your browser:

```bash
kubectl port-forward --address 0.0.0.0 service/nginx-service 80:80 &
```{{exec}}



<details><summary></summary>


Explore the service in your browser:

<details><summary></summary>
Check that nginx is running

[Welcome to NGINX]({{TRAFFIC_HOST1_80}})

<details><summary></summary>
View the "service"
[Cat Pics]({{TRAFFIC_HOST1_80}}/slideshow)

