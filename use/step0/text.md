# The Environment

Before we dive into Helm, we will briefly inspect Kubernetes environment we're working with.

<details><summary></summary>

## Kubernetes

The Kubernetes cluster is already up and running, let's take a look at it.

<details><summary></summary>

### Cluster Nodes

List the nodes available in the cluster:

```bash
kubectl get nodes
```{{exec}}

This command lists all the nodes that are part of the cluster. In this case, there is only one node.

<details><summary></summary>


### View All Pods Across Namespaces

Here is what is running in the minimal cluster

```bash
kubectl get pods --all-namespaces
```{{exec}}

This is a minimal demo environment, so there are only a few pods running.


<details><summary></summary>

### Persistent Volumes

Check the available Persistent Volumes:

```bash
kubectl get pv
```{{exec}}

We have two persistent volumes available on this host.


<details><summary></summary>

## Helm

Finally, let's verify helm is installed and running.

### Helm Version

Get the version of Helm installed:

```bash
helm version
```{{exec}}


<details><summary></summary>


### Helm Releases

List the Helm releases installed in the cluster:

```bash
helm ls
```{{exec}}

None yet.