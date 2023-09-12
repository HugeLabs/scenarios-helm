### What we covered

<details><summary></summary>

* What's a helm chart

<!-- speaker script:
Our Helm chart just a collection of files that describe a set of kubernetes resources, and some values that can be used to configure them.
-->

<details><summary></summary>

* How to create a helm chart with helm create

<!-- speaker script:
We created a helm chart with helm create, and we saw that it created a bunch of files for us. It's a good template and it has a whole lot of sane defaults. Then we deleted it.
-->

<details><summary></summary>

* Create a helm chart from scratch

<!-- speaker script:

We created a helm chart from scratch, and we saw that it's not that hard. We only really only need a few pieces of metadata in the Chart.yaml and some resources. We qee3e configurable parts by putting variables in the resources and then defining them in the values.yaml file.

-->

<details><summary></summary>

* Install a helm chart

<!-- speaker script:
This was easy. We ran one command and Helm customized the resources for us and installed them. We saw that we could override the values in the values.yaml file with the --set flag.
-->

<details><summary></summary>

* Upgrade a helm chart

<!-- speaker script:
We upgraded our chart by changing some values and running helm upgrade. We saw that Helm was smart enough to figure out what changed and only update the resources that needed to be updated.
-->

<details><summary></summary>

* Create annotations for deployment

<!-- speaker script:
We created annotations for our deployment and saw that the pods were "restarted" (killed!! and recreated) when we changed the content.
-->

<details><summary></summary>

## Thank you!

<!-- speaker script:
I appreciate the time you've given me today. I'm love talking about this stuff.
-->

```text

         /\_/\
        ( ^.^ )
  @____ (")_(")

```

<details><summary></summary>

## Questions

