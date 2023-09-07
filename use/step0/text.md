# The Environment

Before we dive into Helm, we will briefly inspect Kubernetes environment we're working with.

## Kubernetes

The Kubernetes cluster is already up and running, so let's take a look at it.

### Cluster Nodes

List the nodes available in the cluster:

```bash
kubectl get nodes
```{{exec}}

This command lists all the nodes that are part of the cluster. In this case, there is only one node.

### View All Pods Across Namespaces

Here is what is running in the minimal cluster

```bash
kubectl get pods --all-namespaces
```{{exec}}

This command lists all the pods running in all namespaces, giving you a comprehensive view of the cluster's current state.

### Cluster Information

Let's check some basic information about the cluster:

```bash
kubectl cluster-info
```{{exec}}

This command provides URLs for Kubernetes master and other services running in the cluster.

## Helm

Finally, let's look take at helm just to verify it's installed and running.


### Helm Version

Get the version of Helm installed on the client and the server:

```bash
helm version
```{{exec}}

### Helm Repositories

Here are the Helm repositories configured on the client:

```bash
helm repo list
```{{exec}}

### Helm Releases

Here are the Helm releases installed in the cluster:

```bash
helm ls
```{{exec}}

(there should be none yet)