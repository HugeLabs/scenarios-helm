## Basic Service


We start with a basic service that we will soon wrap in a helm chart.

<!-- Speaker script:
To start, we'll create a service from a YAML spec. This is a common way to deploy services in Kubernetes. We'll start with a very basic service to wrap in a helm chart. In this case, we'll deploy an Nginx container that will serve static content, but you could just as easily deploy a containerized application.
-->

<details><summary></summary>

### create a namespace

Create a namespace for the service.

<!-- Speaker script:
Namespaces are a way to group resources in Kubernetes. They are a way to organize resources and control access to them. We'll create a namespace for our service to live in. I'll call it "demo".
-->


```bash
kubectl create namespace pre-demo
```{{exec}}


<!-- nah
Verify it was created.

```bash
kubectl get namespace
```{{exec}}

<!-- Speaker script:
This is where we'll deploy the service.
-->

<details><summary></summary>

<!-- Speaker script:
Let's take a look at the YAML files that define our service. I've learned last year's conference that including cats in your presentation is well recieved with this crowd, so, of course, I will use the cat command here.
-->

### The plan

We will deploy the service from YAML specification files in the spec directory.

<!-- Speaker script:
We have a spec directory that contains the YAML files that define our service. We have a deployment, a service, and a configmap. We'll look at each of these in turn.
-->

```bash
ls ~/spec
```{{exec}}

<details><summary></summary>


### Inspect the YAML spec

Let's look at the YAML files that defines our "application".


```bash
cat ~/spec/deployment.yaml
```{{exec}}


<!-- Speaker script:
This is a deployment that will run an Nginx container. It will run one replica of the container. It will mount a configmap as a volume. We'll see the configmap in a moment. The configmap will contain the static content that the Nginx container will serve.
-->


<details><summary></summary>



```bash
cat ~/spec/service.yaml
```{{exec}}


<!-- Speaker script:
This is a service that will expose the Nginx pods in the deployment. The service will be exposed on port 8081. It will forward traffic to port 808101 on the pods.
-->
<details><summary></summary>

```bash
cat ~/spec/configmap.yaml
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
kubectl apply -f ~/spec/ -n pre-demo
```{{exec}}

<details><summary></summary>

### Check what was deployed

Here we find the service and deployment.

<!-- Speaker script:
A quick check to make sure that the service and deployment were created. We can see that the service is exposed on port 8081. The deployment has one replica and is ready to serve traffic. We can also see that the pod is running on the node that we're connected to.
-->

```bash
kubectl get all -n pre-demo
```{{exec}}

<!-- Speaker script:
Note that in kubectl, "get all" doesn't actually get all resources. It gets several resources that are commonly used. The configmap we created is here, but we do need to lookfor it specifically.
-->


<details><summary></summary>

### Check the Configmap

```bash
kubectl get configmap -n pre-demo
```{{exec}}

<details><summary></summary>

## Expose the Service

Now, let's expose the service so that we can access it from the browser:

```bash
kubectl port-forward -n pre-demo --address 0.0.0.0 service/demo-service 8081:8081 &
```{{exec}}

<!-- Speaker script:
Here we use the `kubectl port-forward` command to expose the service on port 8081 of the node that we're connected to. This command will run in the background.
-->


<details><summary></summary>


Explore the service in the browser:

This is a link to port 8081 of the node that we're connected to:

{{TRAFFIC_HOST1_8081}}

<!-- Speaker script:
Here we can see that the service is running and serving our page. We can also see that the service is exposed on port 8081 of the node that we're connected to.
-->

<details><summary></summary>

## Cleanup

<!-- Speaker script:
Now that we've seen the service running, let's clean up the resources we created.
-->

Now that we've seen what we are about to deploy, let's clean up and deploy with helm.
<details><summary></summary>

### Delete

Delete the service:

```bash
kubectl delete namespace pre-demo
```{{exec}}

<!-- Speaker script:
We'll delete the namespace that we created. This will delete all of the resources that we created in that namespace.
-->

<!-- nah
<details><summary></summary>

### Verify

Check to see it's gone:

```bash
kubectl get namespace
```{{exec}}

<!-- Speaker script:
We can see that the namespace was deleted.
-->

<details><summary></summary>

### get back out of the spec directory

```bash
cd ~
```{{exec}}