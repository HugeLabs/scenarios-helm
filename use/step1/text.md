## Create the service from a YAML spec

<details>Steps



### Deploy

<details>Deploy the service with kubectl

#### Inspect the YAML

<details>Inspect the YAML


Let's take a look at the YAML file that we'll be using to deploy the service:

```bash
cat /root/catpics.yaml
```{{exec}}

#### Deploy the YAML

<details>Deploy the YAML

```bash
kubectl apply -f /root/catpics.yaml
```{{exec}}

This will create a PersistentVolumeClaim and a Deployment for our Nginx service.

<details>check

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



<details>3

Explore the service in your browser:

<details>Check that nginx is running

[Welcome to NGINX]({{TRAFFIC_HOST1_80}})

<details>View the "service"
[Cat Pics]({{TRAFFIC_HOST1_80}}/slideshow)

