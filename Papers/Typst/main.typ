#import "conf.typ": *

// COMMENT THE NEXT 2 LINES TO HIDE THE DRAFTING NOTES AND OUTLINE
#outline(title: "TODOs", target: figure.where(kind: "todo"))

#show: e.prepare()

#show: conf.with(
  title: [
    Does Watching Women Work, Work?
  ],
  subtitle: [
    The Effect of Television on Female Labor Outcomes   // Try to always add \* to the end
  ],
  authors: (
    (
      name: "Javier Gonzalez",
      affiliation: "Southern Methodist University",
      email: "gonzalezjj@smu.edu",
    ),
    
  ),
  paper_link: "https://jjgecon.github.io/assets/papers/JMP_Gonzalez_FEI_Telenovelas.pdf",
  abstract: [
  I study the effect of female empowerment in media on female labor market outcomes using Latin American telenovelas.
  Using generative AI, I construct a Female Empowerment Index (FEI) for these TV shows from 1960 to 2024.
  I show that FEI exposure during the impressionable years increases the likelihood of labor force participation among Latin American women.
  To identify the causal effect of FEI exposure, I implement an instrumental variables strategy using detailed data on television signal coverage in Mexico.
  The causal estimates confirm the positive effect of FEI exposure, with an effect size comparable to previous studies.
  Furthermore, FEI changes account for a significant fraction of the aggregate increase in female labor force participation observed over 2010-2020.
  Moreover, both the emotional framing of narratives and the types of jobs depicted play an important role in shaping the effects.
    ],
  thanks: [
    Thanks to Ömer Özak, Klaus Desmet, Wookum Kim, Ivan de las Heras, Rouzhi Liang, Esteban Aleman, Nicolás de Roux, and seminar participants at various seminars in the Universidad de los Andes, Pontificia Universidad Católica de Chile, UNSW, 95th SEA Meeting. Special thanks to Lucas Garcia dos Santos who helped in the validation sample in the early stages of the project. Leonardo Sepulveda and Amparo Olfos provided excellent research assistance.
    Special thanks to the SMU Economics Department Ph.D. students and staff, as well as the O'Donnell Data Science and Research Computing Institute, for providing access to high-performance computing resources.
    Leonardo Sepulveda provided excellent research assistance.
    ],
  JEL_codes: [D91, J16, J22, L82, Z13],
  keywords: [Media, Gender Gap, Social Norms, Latin America, Mass Media, Generative AI, Telenovelas],
)

= Introduction

#include "sections/intro.typ"

= Data

#include "sections/data.typ"

= Empirical Strategy

#include "sections/emp_strat.typ"

== Something else

=== Something else again

#pagebreak()

#set par(leading: 1em)
#bibliography("My Library.bib", style: "econ.csl")

#pagebreak()
#set par(leading: 1.5em)

// Appendix Begins here

#show heading.where(level: 1): it => [
  #set align(left)
  #set text(weight: "bold")
  #block(below: 1em)[#it.body]
]

= Appendix

#show: backmatter

// Some other conf for Appendix
#set figure(numbering: it => {
  //workaround...
  let appx = state("backmatter", false).get()
  let alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  let hdr = counter(heading).get().at(0)
  if appx [#alph.at(hdr - 1).#it]
  else [#hdr.#it]
})

#show heading.where(level: 1): hdr => {
  counter(figure.where(kind:image)).update(0)
  counter(figure.where(kind:table)).update(0)
  hdr
}

#counter(heading).update(0)
#show heading.where(level: 1): it => [
  #set align(left)
  #set text(weight: "bold")
  #block(below: 1em)[#context {counter(heading).display(it.numbering + ".")}#h(0.5em)#smallcaps(it.body)]
]

= Popular Telenovelas

#counter(figure.where(kind: image)).update(0)
#counter(figure.where(kind: table)).update(0)

#figure(
  image("test_img.jpeg", width: 30%),
  caption: [A curious figure.],
) 
