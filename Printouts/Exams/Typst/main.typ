#import "conf.typ": *

// COMMENT THE NEXT 2 LINES TO HIDE THE DRAFTING NOTES AND OUTLINE
#outline(title: "TODOs", target: figure.where(kind: "todo"))

#show: e.prepare()
#show: conf.with(
  title: [
    Exam 1
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
  total_points: "100",
  instructions: [
    - You have *120 minutes* to complete the exam.
    - This a closed-book exam.
    - You may use a calculator.
    - You must show all your work to get full credit for your answers.
    - Please write your answers directly on the exam.
    - If you need more room, append blank pages with your answers but make sure to clearly label the question that you are answering.
  ]
)

= Math

#problem(points: "10", title: "System of equations", label: <p1>)[#todo[create an exercise]
+ asd
+ #lorem(30) $
  alpha + beta / 3 = x
$
+ asd]

#problem(points: "10", title: "Data Analysis", blank_pages: 2)[
  Similar to @p1, let $x=30$ and see 

  #figure(caption: "Internal Migration")[#include "internal_migration.typ"]
  
  ]

#problem(points: "10", title: "Proof")[
  Prove that $1+1=2$.
  ]

= Economics

#problem(points: "10", title: "Proof")[
  Prove that $1+1=2$.
  ]
  
#problem(points: "10", title: "Proof")[
  Prove that $1+1=2$.
  ]
  
#problem(points: "10", title: "Proof")[
  Prove that $1+1=2$.
  ]