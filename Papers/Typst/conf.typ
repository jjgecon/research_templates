
// Configuration Settings by Javier Gonzalez
// For an updates version please see https://github.com/jjgecon/research_templates



#let conf(
  title: none,
  subtitle: none,
  authors: (),
  paper_link: none,
  abstract: none,
  thanks: none,
  doc,
) = {
  // Global settings
  let p_red =  rgb(172, 68, 37)
  let p_blue = rgb(15,82,186)
  let p_green = rgb(79, 121, 66)
  let p_yellow = rgb(186,137,104)

  set page(margin: 2cm, 
           columns: 1)

  set text(font: "Palatino Linotype",
           size: 12pt)

  set align(center)
  par(text(20pt, title ))
  par(text(16pt, subtitle))

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
  
   
  link(paper_link)[
    #text(fill: p_blue)[Latest Available Version]]

  v(1cm)
  block(
    width: 85%,
  )[
    #text(size:16pt)[#smallcaps("Abstract")] \
    #set align(left)
    #par(justify: true)[
     #text(size:11pt)[#abstract]
    ]]

  set align(left)
  v(1fr)
  par(justify: true)[
    #set text(size: 10pt)
      *JEL Clasification:* J20, C10, P20\
      *Keywords:*
    ]
  line(length: 95%, stroke: 0.5pt)
  
  par(first-line-indent: 1em, justify: true)[#text(size: 8pt)[\*#thanks]]
  
  
  pagebreak()
  
  // Main configs after the title page
  // colors

  // Heading settings
  set heading(numbering: "1.1")

  show heading.where(level: 1): it => [
    #set align(center)
    #set text(20pt, weight: "bold")
    #block(below: 1em)[#smallcaps(it.body)]
    ]
  show heading.where(level: 2): it => [
    #set text(16pt, weight: "bold")
    #block[#it]
    ]

  // Link settings
  show link: set text(fill: p_blue)

  // Set figure settings
  set figure.caption(position: top)

  // whole doc bellow
  doc
}


