### Create a Helm Chart for the Service

Here we will encapsulate the same service we deployed manually into a Helm chart for easier management and deployment.

<!-- Speaker script:
In this step, we'll take the service we deployed manually and encapsulate it into a Helm chart. Helm charts are packages of pre-configured Kubernetes resources, making it easier to manage and deploy applications on Kubernetes clusters.
-->


<details><summary></summary>

### Initialize Helm Chart

First, let's initialize a new Helm chart.


```bash
helm create demo-chart-from-template
```{{exec}}

<!-- Speaker script:
This command initializes a new Helm chart with a default directory structure and some boilerplate files. We'll modify these files to fit our service.
-->

<details><summary></summary>

### Explore the helm chart

Let's take a look at the files that were created.

``

```bash
find demo-chart-from-template
```{{exec}}

<!-- Speaker script:
There are, like, a lot of files here, and if we look in a few of them, a whole lot of settings. To be clear, this is a fine starting point for a Helm chart, encapsulating a lot of expertise and best practices from the Helm community. This is where I started and got stuck with my first Helm chart, kind of gawking at the settings. A minimum viable Helm chart can be way simpler than this, and I wish I'd done that first. Just know that the template is there too, and it's good. But we're gonna delete it.
-->


<details><summary></summary>

### nope

The helm create command is useful and actually easy to use, but we're going to disregard it for our minimum viable chart.

```
rm demo-chart-from-template
```{{exec}}

