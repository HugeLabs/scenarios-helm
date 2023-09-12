
<!-- Speaker script:
In this workshop, we are going to create a Helm chart to manage a service. We'll start with a very basic service, then wrap it in a helm chart.
-->

## Before we Begin

<details><summary></summary>

### Intended Audience

Beginners who have not made or customized a Helm chart before.

<!-- Speaker script:
A note about the intended audience, so you don't get bored.

This workshop is intended for people who are new to Helm and want to learn how a minimal helm chart goes together. If you are already familiar with Helm, if you've ever customized a helm template, you might find more value in a different session. I will definitely not be offended if anyone leaves.
-->

<details><summary></summary>

### What is Helm?

<!-- Speaker script:
Helm is a package manager for Kubernetes. It helps you manage Kubernetes applications. Like npm for node.js, or pip for Python, or apt for Debian/Ubuntu, Helm is a package manager, but for the Kubernetes platform. It's a command line tool that you can use to install, upgrade, and remove applications on Kubernetes clusters.

It's also a templating engine that you can use to create reusable templates for Kubernetes resources. Helm charts are packages of pre-configured Kubernetes resources, making it easy to manage and deploy applications on Kubernetes clusters. Helm charts are the recommended way to package and deploy applications on Kubernetes.
-->

Helm is a package manager for Kubernetes.

<details><summary></summary>


# The Environment

Inspect Kubernetes environment.

<!-- Speaker script:
Let's take a look at the environment we'll be working in.
-->

<details><summary></summary>

### Cluster Nodes

List the nodes available in the cluster:

<!-- Speaker script:
An aside on the pronunciation of the Kubernetes command line tool.

I've heard it pronounced "kube control" and "kube cuddle", or kube-c-t-l. But at a local devops meetup, someone suggested the "worst reasonable pronunciation" as ku-bectl, saying it's fun to watch peoples' faces as you say it. It is indeed fun. I've been using that ever since, and I think you should try it too.
-->


```bash
kubectl get nodes
```{{copy}}

<!-- Speaker script:
The Kubernetes cluster is running on a single node.
-->

<details><summary></summary>


### What's running right now?

Pods running in the cluster across all namespaces:

```bash
kubectl get pods --all-namespaces
```{{copy}}
<!-- Speaker script:
This is a minimal demo environment so there is not much running here, but is fully functional and we can use it to demonstrate Helm.
-->

<details><summary></summary>

### Helm

Verify that Helm is installed and configured to use the Kubernetes cluster:

```bash
helm version
```{{copy}}

<details><summary></summary>

Hello, Helm!

### List helm releases

What is Helm doing right now?

```bash
helm ls --all-namespaces
```{{copy}}

<details><summary></summary>



<!-- Speaker script:
We can see that Helm is installed and configured to use the Kubernetes cluster.
<details><summary></summary>
-->

### Helm Releases

List the Helm releases installed in the cluster:

```bash
helm ls --all-namespaces
```{{copy}}

<!-- Speaker script:
None yet. This is the basic environment we'll be working in. Now let's put an application on this cluster.
-->