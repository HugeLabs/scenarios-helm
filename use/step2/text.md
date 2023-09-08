## Create a Helm Chart

Write the Markdown content for creating a Helm chart into \`/root/demochart\`.

### Glossary

```plain
Helm Chart: A package of pre-configured Kubernetes resources.

Helm Release: An instance of a Helm Chart deployed on the cluster.

Helm Values: Parameters that customize the Helm Chart during installation.
```

</details>

<br>

### Create a new Helm chart.

<details><summary>Tip 1 - Create a New Helm Chart</summary>
<br>

```plain
helm create demochart
```{{exec}}

</details>

<br>
<details><summary>Tip 2 - What's inside?</summary>
<br>

```plain{{exec}}
ls demochart
```{{exec}}

</details>

<br>

---

The Helm chart is created. Now, let's customize the chart.