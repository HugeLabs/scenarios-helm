
<details><summary># Create the service</summary>

In this step, we will deploy an Nginx service that will serve some adorable cat pictures. We'll also expose the service so that you can view the pictures in your browser.

 <details><summary>## Deploy</summary>

  <details><summary>

  ### Deploy the Service
  </summary>

  First, let's deploy the service using the YAML file that's already been provided for you:

  ```bash
  kubectl apply -f /root/catpics.yaml
  ```{{exec}}

This will create a PersistentVolumeClaim and a Deployment for our Nginx service.

  <details><summary>

  ### Check that the service is listening
  </summary>

```bash
curl localhost:80
```{{exec}}
  </details>


## Copy Cat Pictures

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