#import "conf.typ": *

// COMMENT THE NEXT 2 LINES TO HIDE THE DRAFTING NOTES AND OUTLINE
#outline(title: "TODOs", target: figure.where(kind: "todo"))

#show: e.prepare()
#show: conf.with(
  submission_n: "#12345",
  title: [
    The Disney Princess Effect:
  ],
  subtitle: [
    Female Labor Decisions and Gender Stereotypes on TV   // Try to always add \* to the end
  ],
  authors: (
    (
      name: "Javier Gonzalez",
      affiliation: "University of Zurich",
      email: "gonzalezjj@smu.edu",
    ),
    (
      name: "Ömer Özak",
      affiliation: "Southern Methodist University",
      email: "ozak@smu.edu",
    ),
  ),
)

= Summary

+ #lorem(20) @pinon_meta-analytic_2005
+ #lorem(26)
+ #lorem(28)

#pagebreak()

= Editor

Thank you for your helpful comments and guidance. We describe how we have addressed all of your concerns below.

When we address a reviewer's comments we will follow#todo[need to change this?]

#todo(position: "inline")[Modify the `reviewerC` function to set comment 1.1 to indicate the reviewer number and comment number]

#reviwerC(label: <c1>)[#lorem(40)] 

Followed by a "To address @c1, we ..."

Mayor modifications to the manuscript will be shown in the following box

#mayor_mod(page_n: "33", og: [#lorem(4)], revised: [#lorem(4) #highlight[#lorem(10)]])

#pagebreak())

= Reviewer 1

#reviwerC(label: <c2>)[#lorem(40)#todo[address this comment]] 

To address @c2, we have added a new section on Page 33 that discusses the implications of our findings for policy and future research.

#mayor_mod(
    page_n: "38", 
    og: [
      #set align(center)
      Figure 3: Internal Migration
      #include("internal_migration.typ")
      ], 
    revised: [
      #set align(center)
      Figure 3: Internal Migration #highlight[CENUS]
      #include("internal_migration_mod.typ")
      ]
    )

#bibliography("My Library.bib", style: "econ.csl")
