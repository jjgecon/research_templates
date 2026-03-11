#import "conf.typ": *

// COMMENT THE NEXT 2 LINES TO HIDE THE DRAFTING NOTES AND OUTLINE
#outline(title: "TODOs", target: figure.where(kind: "todo"))

#show: e.prepare()
#show: conf.with(
  title: [
    Solutions Homework 1
  ],
  class: (
    name: "Price Theory",
    code: "ECON 6301-001",
    semester: "Fall 2024"
  ),
  authors: (
    (
      name: "Javier Gonzalez",
      affiliation: "Southern Methodist University",
      email: "gonzalezjj@smu.edu",
    ),
    
  ),
  paper_link: "https://jjgecon.github.io/",
)

#problem(points: "10", title: "System of equations", label: <p1>)[asdasdasd#todo[create an exercise]]

#solution(target: <p1>)[
  To invert the matrix, we first find the determinant...

  #figure(caption: "Demand and Supply")[
    #image("demand_supply.png", width: 60%)
  ]

  #lorem(600)
]

#problem(points: "10", title: "Data Analysis", label: <p2>)[
  Similar to @p1, let $x=30$ and see 

  #figure(caption: "Internal Migration")[#include "internal_migration.typ"]
  
  ]

#solution(target: <p2>)[
  To invert the matrix, we first find the determinant...

  $
    alpha +beta < 1 - (30/x)
  $
]
