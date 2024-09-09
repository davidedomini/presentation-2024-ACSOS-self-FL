
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

 ### Peer-to-Peer Approach
  <div style="text-align: center; heigth: 80%;">
  <img src="federated-learning-schema-p2p.svg" style="width: 50%" />
  </div>


---

# Clustered Federated Learning

{{% fragment %}}

<div style="text-align: center; heigth: 40%;">
<img src="clustered-FL.svg" style="width: 50%" />
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

---

# Use case

---


# Proximity-based Self-Federated Learning


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
<p> <i class="fa-solid fa-angle-right" style="color: blue;"></i> <b> Experiments </b> available and reproducible <a href="https://github.com/nicolasfara/experiments-2024-ACSOS-opportunistic-federated-learning"> here </a></p>
{{%/ fragment %}}

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