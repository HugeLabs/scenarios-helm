Write the Markdown content for creating a Helm chart into \`/root/demochart\`.

<br>
<details><summary>Info</summary>
<br>

```plain
Helm Chart: A package of pre-configured Kubernetes resources.

Helm Release: An instance of a Helm Chart deployed on the cluster.

Helm Values: Parameters that customize the Helm Chart during installation.
```

</details>

<br>
<details><summary>Tip 1 - Create a New Helm Chart</summary>
<br>

```plain
helm create demochart
```{{exec}}

</details>

<br>
<details><summary>Tip 2 - Explore the Generated Chart</summary>
<br>

```plain{{exec}}
ls demochart/
```

</details>

<br>
<details><summary>Solution</summary>
<br>

Create a new Helm chart and explore its structure.

<br>

```plain
helm create demochart
ls demochart/ > /root/demochart
```{{exec}}

</details>
