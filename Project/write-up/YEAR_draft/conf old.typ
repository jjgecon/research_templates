
#let p_red =  rgb(172, 68, 37)
#let p_blue = rgb(15,82,186)
#let p_green = rgb(79, 121, 66)
#let p_yellow = rgb(186,137,104)

#let conf(
  title: none,
  subtitle: none,
  authors: (),
  abstract: none,
  thanks: none,
  doc,

) = {
  // Global settings
  set page(margin: 2cm, 
           columns: 1)

  set text(font: "Palatino Linotype",
           size: 12pt)

  set align(center)
  par(text(20pt, title ))
  par(text(16pt, subtitle + "*"))

  let count = authors.len()
  let ncols = calc.min(count, 3)
  
  v(1cm)

  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #text(size: 14pt)[#smallcaps(author.name)] \
      #set text(size:10pt, fill: luma(23.14%))
      #author.affiliation \
      #link("mailto:" + author.email)
    ]),
  )
  
  v(1cm)

  block(
    width: 85%,
  )[
    #text(size:16pt)[#smallcaps("Abstract")] \
    #set align(left)
    #par(justify: true)[
     #text(size:11pt)[#abstract]
    ]]

  v(1fr)
  
  line(length: 95%, stroke: 0.5pt)
  set align(left)
  par(first-line-indent: 1em, justify: true)[#text(size: 8pt)[\*#thanks]]
  
  
  pagebreak()
  
  show heading: it => [
    #set text(16pt, weight: "bold")
    #block(smallcaps(it.body))
  ]

  show link: set text(fill: p_blue)

  doc
}


