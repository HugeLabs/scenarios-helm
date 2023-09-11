## Deploy a Service


Here is a basic service that we will later wrap in a helm chart.

<!-- Speaker script:
To start, we'll create a service from a YAML spec. This is a common way to deploy services in Kubernetes. We'll start with a very basic service to wrap in a helm chart. In this case, we'll deploy an Nginx container that will serve static content, but you could just as easily deploy a containerized application.
-->

<details><summary></summary>

### create a namespace

Start by creating a namespace for the service.

```bash
kubectl create namespace demo
```{{exec}}

And we can see it in the list of namespaces.

```bash
kubectl get namespace
```{{exec}}

<!-- Speaker script:
This is where we'll deploy the service.
-->

<details><summary></summary>

### Inspect the YAML spec

<!-- Speaker script:
Let's take a look at the YAML files that define our service. I've learned last year's conference that including cats in your presentation is well recieved with this crowd, and I have a treat for you all. I will use the cat command here.
-->

View the YAML file that defines our service.

```bash
cat /root/spec/deployment.yaml
```{{exec}}

<!-- Speaker script:
This is a deployment that will create a single replica of the Nginx container. It serve static content that we'll define in a configmap later.
-->

```bash
cat /root/spec/service.yaml
```{{exec}}

<!-- Speaker script:
This is a service that will expose the Nginx container on port 80.
-->

```bash
cat /root/spec/configmap.yaml
```{{exec}}

<!-- Speaker script:
Here we define the static content that the Nginx container will serve.
-->

<details><summary></summary>

### Deploy the YAML spec

<!-- Speaker script:
Now we deploy the service from the spec. We'll use the `kubectl apply` command to deploy it into the namespace we made. This will create the Configmap, Deployment, and Service.  Applying this spec tells kubernetes that these items should exist in the cluster. If they already exist, it will update them to match the spec. If they don't exist, it will create them. Kubernetes will then start working to make sure that the cluster matches the spec.
-->

Deploy the service from the YAML files in the spec directory.

```bash
kubectl apply -f /root/spec/ -n demo
```{{exec}}

<details><summary></summary>

### Check what was deployed

Here we find the service and deployment.

<!-- Speaker script:
A quick check to make sure that the service and deployment were created. We can see that the service is exposed on port 80. The deployment has one replica and is ready to serve traffic. We can also see that the pod is running on the node that we're connected to.
-->

```bash
kubectl get all -n demo
```{{exec}}

<!-- Speaker script:
Note that in kubectl, "get all" doesn't actually get all resources. It gets several resources that are commonly used. The configmap we created is here, but we do need to lookfor it specifically.
-->


<details><summary></summary>

### Check the Configmap

```bash
kubectl get configmap -n demo
```{{exec}}

<details><summary></summary>

## Expose the Service

Now, let's expose the service so that we can access it from the browser:

```bash
kubectl port-forward -n demo --address 0.0.0.0 service/demo 80:80 &
```{{exec}}

<!-- Speaker script:
Here we use the `kubectl port-forward` command to expose the service on port 80 of the node that we're connected to. This command will run in the background.
-->


<details><summary></summary>


Explore the service in the browser:

This is a link to port 80 of the node that we're connected to:

[{{TRAFFIC_HOST1_80}}]({{TRAFFIC_HOST1_80}})



<!-- Speaker script:
Here we can see that the service is running and serving our page. We can also see that the service is exposed on port 80 of the node that we're connected to.
-->