
+++

title = "Proximity-based Self-Federated Learning"
description = "ACSOS 2024 main-track paper presentation"
outputs = ["Reveal"]
aliases = [
    "/guide/"
]

+++

# Proximity-based Self-Federated Learning


[<span style="color: #BD4089">Davide Domini</span>](mailto:davide.domini@unibo.it) <i class="fa-solid fa-circle-nodes"></i>,
[Gianluca Aguzzi](mailto:gianluca.aguzzi@unibo.it) <i class="fa-solid fa-circle-nodes"></i>,
[Nicolas Farabegoli](mailto:nicolas.farabegoli@unibo.it) <i class="fa-solid fa-circle-nodes"></i>,
[Mirko Viroli](mailto:mirko.viroli@unibo.it) <i class="fa-solid fa-circle-nodes"></i>,
[Lukas Esterle](mailto:lukas.esterle@ece.au.dk) <i class="fa-solid fa-laptop-code"></i>

International Conference on Autonomic Computing and Self-Organazing Systems @ ACSOS 2024

<br>

{{% multicol %}}
{{% col %}}
<div style="text-align: center; width: 100%;">
<img src="disi.svg" style="width: 60%" />
</div>
<i class="fa-solid fa-circle-nodes"></i> Department of Computer Science and Engineering, University of Bologna, Cesena (FC), Italy
{{% /col %}}
{{% col %}}
<div style="text-align: center; width: 100%;">
<img src="aarhus.svg" style="width: 23%" />
</div>
<i class="fa-solid fa-laptop-code"></i> Department of Electrical and Computer Engineering, Aarhus University, Aarhus (AAR), Denmark
{{% /col %}}
{{% /multicol %}}

---

# Use case

{{<multicol>}}

{{<col>}}

<div style="text-align: left; margin-left:0%;">
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <b>Scenario:</b> a decentralized system for healthcare monitoring </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <b>Task:</b> predict potential health problems in our patients (e.g., stroke prediction) </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <b>Problem:</b> users' privacy </p>
<div style="text-align: left; margin-left:3%; font-size: 18pt;">
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <em>Solution:</em> Federated Learning </p>
</div>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <b>Problem:</b> different users may have different health profiles (heterogeneous data)</p>
<div style="text-align: left; margin-left:3%; font-size: 18pt;">
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <em>Solution:</em> Clustered approaches </p>
</div>
</div>
{{</col>}}

{{<col>}}
<div style="margin-left:20%;">
<img src="keyboard.svg" style="width: 100%" />
</div>
{{</col>}}

{{</multicol>}}

<!-- ---
# Federated Learning in a nutshell

{{<multicol>}}

  {{<col>}}
  {{% fragment %}}

  ### Centralized Approach
  <div style="text-align: center; heigth: 100%;">
  <img src="federated-learning-schema.svg" style="width: 100%" />
  </div>

  {{%/ fragment %}}

  {{</col>}}

  {{<col>}}

  <br> <br> 

  {{% fragment %}}

 ### Pros 

<p> <i class="fa-solid fa-check" style="color: green;"></i> Reduces privacy concern </p>
<p> <i class="fa-solid fa-check" style="color: green;"></i> Transfer less data to the server </p>
{{%/ fragment %}}
{{% fragment %}}

### Cons

<p> <i class="fa-solid fa-xmark" style="color: red;"></i> Need for a central trusted entity </p>
<p> <i class="fa-solid fa-xmark" style="color: red;"></i> Single point of failure </p>
<p> <i class="fa-solid fa-xmark"style="color: red;"></i> Data heterogeneity </p>
{{%/ fragment %}}

  {{</col>}}
{{</multicol>}}

---

# Federated Learning in a nutshell (2)

{{<multicol>}}

  {{<col>}}

  {{% fragment %}}

 ### Peer-to-Peer Approach

  <div style="text-align: center; heigth: 100%;">
  <img src="federated-learning-schema-p2p.svg" style="width: 100%" />
  </div>

  {{%/ fragment %}}

  {{</col>}}

  {{<col>}}

  {{% fragment %}}


  ### Still some cons

  <p> <i class="fa-solid fa-xmark"style="color: red;"></i> Data heterogeneity </p>
  <p> <i class="fa-solid fa-xmark"style="color: red;"></i> Communication overhead in the network </p>

  {{%/ fragment %}}

  {{</col>}}


{{</multicol>}}
-->
--- 

# Clustered Federated Learning

<img src="clustered-FL.svg" style="width: 50%" />

{{<multicol>}}

{{<col>}}
<div style="text-align: left; font-size: 20pt;">

{{% fragment %}}
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <em>Assumption:</em> clients can be divided in clusters (IID data within each cluster) </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <em>Multiple models </em> are trained to target various local distributions </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <em>Similarity measures:</em> loss based, gradient based, weight based </p>
{{%/ fragment %}}

</div>


{{</col>}}

{{<col>}}
<div style="font-size: 20pt;">

{{% fragment %}}

<div style="text-align: left; font-size: 20pt; margin-left:10%;">
<p> <i class="fa-solid fa-xmark"style="color: red;"></i> Clustering is performed by a central server </p>
<p> <i class="fa-solid fa-xmark"style="color: red;"></i> Number of clusters must be defined a priori </p>
</div>
{{%/ fragment %}}
</div>
{{</col>}}

{{</multicol>}}



---

# Proximity-based Self-Federated Learning

---

# Formalization

  
  <div style="text-align:left; margin-left:25%">
  <p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> A spatial area $A = \{ a_1, ..., a_k \}$ divided into <em>$k$ distinct continuos area </em></p>
  <p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Each area $a_j$ has a <em>unique local data distribution</em> $\Theta_j$ </p>
  <p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> A set of <em>sensor nodes</em> $S = \{ s_1, ..., s_n\} (n > |A|)$ are deployed in $A$ </p>
  <p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Each sensor will be located in a <em>specific area</em> $a_j$ </p>
  <p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Each sensor has a certain <em>communication range</em> $r_c$ </p>
  <p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Each sensor $s_i$ has a certain <em>neighbourhood</em> $N_i$ </p>
  <p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> The complete <em>local dataset</em> $D_i$ is represented as $D_i = \{ (x_1, y_1), ..., (x_m, y_m) \}$ </p>
  </div>

  <img
    src="problem-definition-only1.svg"
    style = "heigth: 100%"
  />

---

# What we want to obtain?

<img src="what-we-want.svg" style="width: 70%" />

<div style="text-align:left; margin-left:12%">
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Starting from the network of devices we want to <em>cluster devices into groups</em> following a certain similarity metric </p>
  <p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Then, we want to <em>elect</em> some special nodes called <em>leaders</em> </p>
  <p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Leaders could be elected following <em>different policies</em> (e.g., devices with the higher computational power) </p>
</div>

---

# Algorithm overview

<br> <br> 

{{<multicol>}}

{{<col>}}

<div class="r-stack">

  <img
      class="fragment current-visible"
      data-fragment-index="0"
      src="algorithm-overview-1.svg"
      style = "width: 100%"
  />
  <img
      class="fragment current-visible"
      data-fragment-index="1"
      src="algorithm-overview-2.svg"
      style = "width: 100%"
  />

</div>

  {{</col>}}
{{</multicol>}}

---

# Loss based Similarity

> If the model trained by client A has a loss smaller than a certain threshold on the dataset of the client B (and viceversa),<br>  then the two clients should be considered similar.

<br>

{{<multicol>}}

{{<col>}}

<div class="r-stack">

  <img
      class="fragment current-visible"
      data-fragment-index="0"
      src="loss-dissimilarity.svg"
      style = "width: 80%"
  />
  <img
      class="fragment current-visible"
      data-fragment-index="1"
      src="loss-dissimilarity2.svg"
      style = "width: 80%"
  />

</div>

  {{</col>}}
{{</multicol>}}

--- 

# Space-fluid sparse choice

<div style="text-align:left; margin-left:32%; font-size:20pt;%">
<p> Let: </b>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> $m(n_1, n_2)$ be a <em>similarity metric</em> between two nodes </p> 
<p> <i class="fa-solid fa-angle-right" style="color: #22373b"></i> $\sigma > 0$ be the <em>maximum acceptable error</em> </p> 
</div>
{{<multicol>}}

{{<col class="col-7">}}

<div class="r-stack">

  <img
    class="fragment current-visible"
    data-fragment-index="0"
    src="leader-choice-1.svg"
    style = "width: 100%"
  />
  <img
    class="fragment current-visible"
    data-fragment-index="1"
    src="leader-choice-2.svg"
    style = "width: 100%"
  />
  <img
    class="fragment current-visible"
    data-fragment-index="2"
    src="leader-choice-3.svg"
    style = "width: 100%"
  />

  <img
    class="fragment current-visible"
    data-fragment-index="3"
    src="leader-choice-4.svg"
    style = "width: 100%"
  />

</div>

{{</col>}}

{{<col class="col-5">}}

  <div 
  style="text-align:left; margin-left:15%; font-size:18pt;"
  class="fragment"
  data-fragment-index="2"
  >
  
  <p>Suppose: </p>
  <p><i class="fa-solid fa-angle-right" style="color: #22373b;"></i> $m(l, n_1) + m(n_1, n_2) < \sigma$ </p>
  <p><i class="fa-solid fa-angle-right" style="color: #22373b;"></i> $m(l, n_1) + m(n_1, n_2) + m(n_2, n_3) > \sigma$ </p>
  </div>
{{</col>}}

{{</multicol>}}

--- 

# Experimental evaluation

<br>
{{% fragment %}}

<div style="text-align:left; margin-left:33%">

<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <em> Dataset: </em> Extended MNIST - Handwritten Letters </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <em> 26 classes </em> (latin alphabet) </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <em> 124800 </em> train samples </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <em> 20800 </em> test samples </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Synthetically split in <em> {3, 5, 9} </em> areas </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Simulations realized in <em>Alchemist</em>¹, algorithms written in <em>ScaFi</em>² </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> <em> Experiments </em> available and reproducible <a href="https://github.com/nicolasfara/experiments-2024-ACSOS-opportunistic-federated-learning"> here </a></p>


</div>

<div style="text-align:left; margin-left:5%; font-size:15pt;">

1. https://alchemistsimulator.github.io/

2. https://scafi.github.io/
</div>

{{%/ fragment %}}

---

# Simulation

<video style="width: 70%;" autoplay loop muted playsinline>
  <source src="selfFL.mp4" type="video/mp4">
</video>

---

# Results (1)

<img
    src="results.svg"
    style = "width: 100%"
/>

---

# Results (2)

<img
    src="results-test.svg"
    style = "width: 100%"
/>

---


<!-- {{<multicol>}}

{{<col class="col-6">}}

<h1> Conclusions </h1>

<br>

{{% fragment %}}
<div style="text-align:left; margin-left:0%">

<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Federations are correctly created without defining a number of cluster a priori </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> PSFL adapts to different network topologies (centralized, semi-centralized, peer-to-peer)   </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Thanks to specialization is possible to use smaller models </p>

</div>
{{%/ fragment %}}

{{</col>}}

{{<col class="col-6">}}

<h1> Future work </h1>

<br>

{{% fragment %}}
<div style="text-align:left; margin-left:0%">

<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Investigate the effect of node mobility on the federation' stability </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Investigate the potential of PSFL to adapt to dynamic network topologies </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Investigate the potential of PSFL to adapt to data distributions that change over time </p>
hierarchical?
</div>
{{%/ fragment %}}

{{</col>}}

{{</multicol>}}
{{% fragment %}}

<img
    src="qr-preprint.svg"
    style = "width: 30%"
/>

{{%/ fragment %}} -->

# Future work

<div style="text-align:left; margin-left:20%">
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Using <em>sparse neural network</em> for low resource settings </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Investigate the effect of <em>node mobility</em> on the federations stability </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Investigate the potential of PSFL to adapt to <em>dynamic network topologies</em> </p>
<p> <i class="fa-solid fa-angle-right" style="color: #22373b;"></i> Integrate continual learning approaches to adapt to <em>data distributions that change over time</em> </p>
</div>