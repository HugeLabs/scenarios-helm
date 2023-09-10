# Before We Begin

## Audience

This workshop is intended for people who are new to Helm and want to learn how a minimal helm chart goes together. If you are already familiar with Helm, you might find more value in a different session. I will definitely not be offended if anyone leaves.

<details><summary></summary>


# The Environment

Let's inspect Kubernetes environment we're working with.

<details><summary></summary>

## Kubernetes

The Kubernetes cluster is already up and running. We'll take a look at it.

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

<!-- Speaker script:
There is not much running here but it is enough to demonstrate Helm.
-->

<details><summary></summary>

## Helm

Verify helm is installed and running.

### Helm Version

Get the version of Helm installed:

```bash
helm version
```{{exec}}


<details><summary></summary>


### Helm Releases

List the Helm releases installed in the cluster:

```bash
helm ls --all-namespaces
```{{exec}}

None yet.