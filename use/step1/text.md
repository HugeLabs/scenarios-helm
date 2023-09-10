## Create the service from a YAML spec

<details><summary>Steps</summary>



### Deploy

<details><summary>Deploy the service with kubectl</summary>

#### Inspect the YAML

<details><summary>Inspect the YAML</summary>


Let's take a look at the YAML file that we'll be using to deploy the service:

```bash
cat /root/catpics.yaml
```{{exec}}

#### Deploy the YAML

<details><summary>Deploy the YAML</summary>

```bash
kubectl apply -f /root/catpics.yaml
```{{exec}}

This will create a PersistentVolumeClaim and a Deployment for our Nginx service.

<details><summary>check</summary>

#### Check that the service is listening


```bash
curl localhost:80
```{{exec}}
  </details>


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
</details>



<details><summary>3</summary>

Explore the service in your browser:

<details><summary>Check that nginx is running</summary>

[Welcome to NGINX]({{TRAFFIC_HOST1_80}})
</details>

<details><summary>View the "service"</summary>
[Cat Pics]({{TRAFFIC_HOST1_80}}/slideshow)
</details>
</details>

</details>
</details>
</details>


</details>
