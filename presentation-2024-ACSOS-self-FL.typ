#import "@preview/polylux:0.3.1": *
#import "@preview/fontawesome:0.1.0": *

#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  //footer: [Optional Footnote]
)

#set text(font: "Fira Sans", weight: 350, size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 200)
#set par(justify: true)

#set quote(block: true)
#show quote: set align(left)
#show quote: set pad(x: 2em, y: -0.8em)

#set raw(tab-size: 4)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 1em,
  radius: 0.7em,
  width: 100%,
)

#show bibliography: set text(size: 0.8em)
#show footnote.entry: it => {
  block(inset: (x: 2em, y: 0.1em))[#text(size: 0.75em)[#it.note.body]]
}

#let fcite(clabel) = {
  footnote(cite(form: "full", label(clabel)))
}

#let author = block(inset: 0.1em)[
  #table(inset: 0.5em, stroke: none, columns: (auto, 4fr),  align: (left, left),
    [#alert[*Davide Domini*]], [`davide.domini@unibo.it`],
    [Gianluca Aguzzi], [`gianluca.aguzzi@unibo.it`],
    [Nicolas Farabegoli], [`nicolas.farabegoli@unibo.it`],
    [Mirko Viroli], [`mirko.viroli@unibo.it`],
    [Lukas Esterle], [`lukas.esterle@ece.au.dk`],
  )
  #place(right, dy:-1.5em)[
    #figure(image("images/disi.svg", width:40%))
  ]
]

#title-slide(
  title: "Proximity-based Self-Federated Learning",
  subtitle: "TALK @ ACSOS 2024",
  author: author,
  // date: datetime.today().display("[day] [month repr:long] [year]"),
)

#new-section-slide("Background")

#slide(title: "Slide")[
  *Bold* and _italic_ text.
  
  This is a citiation @nicolas_farabegoli_2024_10535841.

  #alert[
    This is an alert.
  ]
]

#slide(title: "Code slide")[
  ```kotlin
  fun main() {
      println("Hello, world!")

      for (i in 0..9) {
          println(i)
      }
      println("Goodbye, world!")
  }
  ```
]

#slide[
  = This is a title

  #lorem(24)

  == This is a subtitle

  #lorem(34)
]

#slide[

  == Icon in a title #fa-java()

  #fa-icon("github", fa-set: "Brands") -- Github icon

  #fa-icon("github", fa-set: "Brands", fill: blue) -- Github icon blue fill
]

#slide[
  #bibliography("bibliography.bib")
]
