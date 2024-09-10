
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


---
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

{{% fragment %}}
<p> <i class="fa-solid fa-check" style="color: green;"></i> Reduces privacy concern </p>
{{%/ fragment %}}
{{% fragment %}}
<p> <i class="fa-solid fa-check" style="color: green;"></i> Transfer less data to the server </p>
{{%/ fragment %}}

{{% fragment %}}

### Cons
{{%/ fragment %}}


{{% fragment %}}
<p> <i class="fa-solid fa-xmark" style="color: red;"></i> Need for a central trusted entity </p>
{{%/ fragment %}}

{{% fragment %}}
<p> <i class="fa-solid fa-xmark" style="color: red;"></i> Single point of failure </p>
{{%/ fragment %}}

{{% fragment %}}
<p> <i class="fa-solid fa-xmark"style="color: red;"></i> Data heterogeneity </p>
{{%/ fragment %}}


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

  {{% fragment %}}
  <p> <i class="fa-solid fa-xmark"style="color: red;"></i> Data heterogeneity </p>
  {{%/ fragment %}}

  {{% fragment %}}
  <p> <i class="fa-solid fa-xmark"style="color: red;"></i> Communication overhead in the network </p>
  {{%/ fragment %}}

  {{%/ fragment %}}

  {{</col>}}


{{</multicol>}}

---

# Clustered Federated Learning

{{% fragment %}}

<div style="text-align: center; heigth: 40%;">
<img src="clustered-FL.svg" style="width: 45%" />
</div>

{{%/ fragment %}}

{{% fragment %}}
<p> <span style="color: #fd8300;">Assumption:</span> clients can be divided in clusters (IID data within each cluster) </p>
{{%/ fragment %}}

{{% fragment %}}
<p> <span style="color: #fd8300;">Multiple models </span> are trained to target various local distributions </p>
{{%/ fragment %}}

{{% fragment %}}
<p> <span style="color: #fd8300;">Similarity measures:</span> loss based, gradient based, weight based </p>
{{%/ fragment %}}

{{% fragment %}}
### BUT
{{%/ fragment %}}

{{% fragment %}}
<p> <i class="fa-solid fa-xmark"style="color: red;"></i> Clustering is performed by a central server </p>
{{%/ fragment %}}

{{% fragment %}}
<p> <i class="fa-solid fa-xmark"style="color: red;"></i> Number of clusters must be defined a priori </p>
{{%/ fragment %}}


---


# Proximity-based Self-Federated Learning


---

# Let's abstract the use case

  
  <div style="text-align:left; margin-left:20%">
  <p> <i class="fa-solid fa-angle-right" style="color: black;"></i> A spatial area $A = \{ a_1, ..., a_k \}$ divided into $k$ distinct continuos area </p>
  <p> <i class="fa-solid fa-angle-right" style="color: black;"></i> Each area $a_j$ has a unique local data distribution $\theta_j$ </p>
  <p> <i class="fa-solid fa-angle-right" style="color: black;"></i> A set of sensor nodes $S = \{ s_1, ..., s_n\} (n > |A|)$ are deployed in $A$ </p>
  <p> <i class="fa-solid fa-angle-right" style="color: black;"></i> Each sensor will be located in a specifica area $a_j$ </p>
  <p> <i class="fa-solid fa-angle-right" style="color: black;"></i> Each sensor has a certain communication range $r_c$ </p>
  <p> <i class="fa-solid fa-angle-right" style="color: black;"></i> Each sensor $s_i$ has a certain neighbourhood $N_i$ </p>
  <p> <i class="fa-solid fa-angle-right" style="color: black;"></i> The complete local dataset $D_i$ is represented as $D_i = \{ (x_1, y_1), ..., (x_m, y_m) \}$ </p>
  </div>

  <img
    src="problem-definition-only1.svg"
    style = "heigth: 100%"
  />

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

# Loss based dissimilarity

> if two clients
<br>

{{<multicol>}}

{{<col>}}

<div class="r-stack">

  <img
      class="fragment current-visible"
      data-fragment-index="0"
      src="loss-dissimilarity.svg"
      style = "width: 100%"
  />
  <img
      class="fragment current-visible"
      data-fragment-index="1"
      src="loss-dissimilarity2.svg"
      style = "width: 100%"
  />

</div>

  {{</col>}}
{{</multicol>}}

--- 

# Space-fluid sparse choice

--- 

# Experimental evaluation

<div style="text-align:left; margin-left:33%">
{{% fragment %}}
<p> <i class="fa-solid fa-angle-right" style="color: blue;"></i> <b> Dataset: </b> Extended MNIST - Handwritten Letters </p>
{{%/ fragment %}}

{{% fragment %}}
<p> <i class="fa-solid fa-angle-right" style="color: blue;"></i> <b> 26 classes </b> (latin alphabet) </p>
{{%/ fragment %}}

{{% fragment %}}
<p> <i class="fa-solid fa-angle-right" style="color: blue;"></i> <b> 124800 </b> train samples </p>
{{%/ fragment %}}

{{% fragment %}}
<p> <i class="fa-solid fa-angle-right" style="color: blue;"></i> <b> 20800 </b> test samples </p>
{{%/ fragment %}}


{{% fragment %}}
<p> <i class="fa-solid fa-angle-right" style="color: blue;"></i> Synthetically split in <b> {3, 5, 9} </b> areas </p>
{{%/ fragment %}}

{{% fragment %}}
<p> <i class="fa-solid fa-angle-right" style="color: blue;"></i> Simulations realized in <b>Alchemist</b>¹, algorithms written in <b>ScaFi</b>² </p>
{{%/ fragment %}}

{{% fragment %}}
<p> <i class="fa-solid fa-angle-right" style="color: blue;"></i> <b> Experiments </b> available and reproducible <a href="https://github.com/nicolasfara/experiments-2024-ACSOS-opportunistic-federated-learning"> here </a></p>
{{%/ fragment %}}

</div>

<div style="text-align:left; margin-left:5%; font-size:15pt;">

1. https://alchemistsimulator.github.io/

2. https://scafi.github.io/
</div>

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

# Conclusions and future works


---