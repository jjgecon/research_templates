#import "conf.typ": *

// COMMENT THE NEXT 2 LINES TO HIDE THE DRAFTING NOTES AND OUTLINE
#outline(title: "TODOs", target: figure.where(kind: "todo"))

#show: e.prepare()
#show: conf.with(
  title: [
    Homework 1
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

#problem(points: "10", title: "Data Analysis")[
  Similar to @p1, let $x=30$ and see 

  #figure(caption: "Internal Migration")[#include "internal_migration.typ"]
  
  ]
