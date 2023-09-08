# Deploying and Exposing the Cat Pictures Service

In this step, we will deploy an Nginx service that will serve some adorable cat pictures. We'll also expose the service so that you can view the pictures in your browser.

## Deploy the Service

First, let's deploy the service using the YAML file that's already been provided for you:

\```bash
kubectl apply -f /root/catpics.yaml
\```{{exec}}

This will create a PersistentVolumeClaim and a Deployment for our Nginx service.

## Copy Cat Pictures

Next, let's copy some cat pictures into the Nginx container. For the sake of this demo, assume that the cat pictures have already been downloaded to a directory on the host.

\```bash
# Find the name of the Nginx pod
POD_NAME=$(kubectl get pods -l app=nginx -o jsonpath="{.items[0].metadata.name}")

# Copy cat pictures into the pod
kubectl cp /path/to/cat/pics $POD_NAME:/usr/share/nginx/html/images
\```{{exec}}

## Expose the Service

Now, let's expose the service so that you can access it from your browser:

\```bash
kubectl port-forward --address 0.0.0.0 service/nginx-service 80:80
\```{{exec}}

You can now access the cat pictures by clicking on the link below:

[Access Cat Pics]({{TRAFFIC_HOST1_80}})
