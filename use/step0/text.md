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

Thsi is a minimal demo environment, so there are only a few pods running.

### Persistent Volumes

Check the available Persistent Volumes:

```bash
kubectl get pv
```{{exec}}

We have two persistent volumes available on this host.

## Helm

Finally, let's verify helm is installed and running.

### Helm Version

Get the version of Helm installedL:

```bash
helm version
```{{exec}}

### Helm Repositories

List the Helm repositories configured on the client:

```bash
helm repo list
```{{exec}}

None yet.

### Helm Releases

List the Helm releases installed in the cluster:

```bash
helm ls
```{{exec}}

Also none yet.