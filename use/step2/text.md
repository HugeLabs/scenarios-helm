Create a Helm Chart for the Service
Here we will encapsulate the same service we deployed manually into a Helm chart for easier management and deployment.

<!-- Speaker script:
In this step, we'll take the service we deployed manually and encapsulate it into a Helm chart. Helm charts are packages of pre-configured Kubernetes resources, making it easier to manage and deploy applications on Kubernetes clusters.
-->


<details><summary></summary>
First, let's initialize a new Helm chart.

<details><summary></summary>

```bash
helm create catpics-chart
```{{exec}}

<!-- Speaker script:
This command initializes a new Helm chart with a default directory structure and some boilerplate files. We'll modify these files to fit our service.
-->

<details><summary></summary>

### Modify Helm Chart

Now, let's modify the Helm chart to include our service's YAML spec.

<details><summary></summary>

```bash
# Copy the existing YAML spec into the Helm chart
cp /root/catpics.yaml catpics-chart/templates/
```{{exec}}

<!-- Speaker script:
We copy our existing YAML spec into the `templates` directory of the Helm chart. Helm will use this directory to find the Kubernetes resources to deploy.
-->

<details><summary></summary>

### Package Helm Chart

Now, let's package the Helm chart.

<details><summary></summary>

```bash
helm package catpics-chart
```{{exec}}

<!-- Speaker script:
Packaging the Helm chart creates a versioned archive file of your chart. This makes it easier to deploy and share.
-->

<details><summary></summary>

### Deploy Helm Chart

Finally, let's deploy the Helm chart into a new namespace

<details><summary></summary>


Create the namespace:

```bash
kubectl create namespace helm-demo
```{{exec}}

And install the chart:

```bash
helm install catpics catpics-chart/ --namespace helm-demo
```{{exec}}

<!-- Speaker script:
Here we create a new namespace for the Helm chart and deploy the chart into that namespace. We use the `helm install` command to deploy the chart. In this case, we're naming the release `catpics` and deploying the chart from the `catpics-chart` directory. We also specify the namespace to deploy into with the `--namespace` flag.

-->

<details><summary></summary>

### Verify Helm Deployment

Let's verify that the Helm deployment was successful.

<details><summary></summary>

```bash
helm list -n demo
```{{exec}}

<!-- Speaker script:
This command lists all the Helm releases in the `demo` namespace, allowing us to verify that our Helm chart has been successfully deployed.
-->

<details><summary></summary>

### Explore the Service Again

Since we used the same namespace and service definitions, the service URL remains the same.

<details><summary></summary>
View the "service" again
[Cat Pics]({{TRAFFIC_HOST1_80}}/slideshow)

<!-- Speaker script:
Since we deployed the Helm chart into the same namespace with the same service definitions, you can access the service at the same URL as before.
-->

This concludes Step 2 of our presentation, where we encapsulated our manually deployed service into a Helm chart for easier management and deployment.

**Estimated Time for Step 2**: 6-7 minutes

Feel free to adjust the timing and content as needed for your presentation.



