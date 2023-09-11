# Before We Begin

<!-- Speaker script:
In this workshop, we'll create a Helm chart to manage a service. We'll use a precreated specification as a starting point for our Helm chart templates.
-->

## Audience

Beginners who have not made or customized a Helm chart before.

<!-- Speaker script:
This workshop is intended for people who are new to Helm and want to learn how a minimal helm chart goes together. If you are already familiar with Helm, if you've ever customized a helm template, you might find more value in a different session. I will definitely not be offended if anyone leaves.

Helm is a package manager for Kubernetes. It helps you manage Kubernetes applications. Like npm for Node.js, or NuGet for .NET but for the Kubernetes platform. It's a command line tool that you can use to install, upgrade, and remove applications on Kubernetes clusters.

It's also a templating engine that you can use to create reusable templates for Kubernetes resources. Helm charts are packages of pre-configured Kubernetes resources, making it easy to manage and deploy applications on Kubernetes clusters. Helm charts are the recommended way to package and deploy applications on Kubernetes.
-->



<details><summary></summary>


# The Environment

Inspect Kubernetes environment.

<!-- Speaker script:
Let's take a look at the environment we'll be working in. We are using a Kubernetes cluster with a single node. And we have Helm installed and configured in this cluster.
-->

<details><summary></summary>

## Kubernetes

Inspect the Kubernetes cluster.


### Cluster Nodes

List the nodes available in the cluster:

```bash
kubectl get nodes
```{{exec}}

<!-- Speaker script:
The Kubernetes cluster is running on a single node.
-->

<details><summary></summary>


### What's running right now?

Check what's running in the cluster across all namespaces:

```bash
kubectl get pods --all-namespaces
```{{exec}}
<!-- Speaker script:
This is a minimal demo environment so there is not much running here, but is fully functional and we can use it to demonstrate Helm.
-->

<details><summary></summary>

## Helm

Verify helm is installed and running.

### Helm Version

Get the version of Helm installed:

```bash
helm version
```{{exec}}

<!-- Speaker script:
We can see that Helm is installed and configured to use the Kubernetes cluster.
<details><summary></summary>


### Helm Releases

List the Helm releases installed in the cluster:

```bash
helm ls --all-namespaces
```{{exec}}

<!-- Speaker script:
None yet.
-->