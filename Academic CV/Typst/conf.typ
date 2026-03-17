#import "@preview/fontawesome:0.6.0": *

#let p_red =  rgb(172, 68, 37)
#let p_blue = rgb(15,82,186)
#let p_green = rgb(79, 121, 66)
#let p_yellow = rgb(186,137,104)

#let conf(
  name: none,
  university: (name: none, 
               department: none,
               address: none),
  orcid_number: none,
  email: none,
  webpage: none,
  github: none,
  latest_version_link: none,
  doc
) = {
  // Global settings
  set page(margin: 2cm, 
           columns: 1)

  set text(font: "Helvetica",
           size: 11pt)

  align(center)[#par(text(24pt, weight: "bold")[
    #upper(name)  #link("https://orcid.org/" + orcid_number)[#fa-icon("orcid")]
  ])]
  
  v(0.5cm)
  line(length: 100%, stroke: 0.5pt)

  grid(
    columns: (2fr, 1fr),
    row-gutter: 5pt,
    rows: (auto, auto,auto),
    align: (left, right),
    university.name,  link(webpage)[#text(fill: p_blue)[#webpage] #fa-icon("globe", solid: true)],
    "Department of " + university.department, link("mailto:" + email)[#text(fill: p_blue)[#email] #fa-icon("envelope", solid: true)],
    university.address, link("https://github.com/" + github)[#text(fill: p_blue)[#github] #fa-icon("github")],
    text()[Updated as of #datetime.today().display()], link("https://jjgecon.github.io/assets/JGonzalez_cv.pdf")[#text(fill: p_blue)[click here for lastest version]]
  )
  
  line(length: 100%, stroke: 0.5pt)

  show heading: it => {
      set block(spacing: 1em)  // Adds vertical spacing
      it
      }

  show heading.where(level: 2): set text(1em)
  
  set par(justify: true, spacing: 1.2em)

  set list(spacing: 1.2em)
  set enum(spacing: 1.2em)
  doc
}