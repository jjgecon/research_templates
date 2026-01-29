// Put here all the extra packages that you 
#import "@preview/dashy-todo:0.1.3": todo

#let p_red =  rgb(172, 68, 37)
#let p_blue = rgb(15,82,186)
#let p_green = rgb(79, 121, 66)
#let p_yellow = rgb(186,137,104)

//  add a similar to the LaTeX paragraph
#let sentence_start(body_of_text) = {
  text[*#body_of_text* #h(.2cm)] 
}

// Create figure notes
#let fig_notes(body_of_text, width: 100%, spacing: 0.8em) = {
  box(inset: 1pt, width: width)[
  #align(left)[
  #set par(justify: true, leading: spacing)
  #text(0.7em)[Notes: #body_of_text]
  ]
  ]
}

#let backmatter(content) = {
	set heading(numbering: "A.1")
	counter(heading).update(0)
	state("backmatter").update(true)
	content
  }

#let conf(
  title: none,
  subtitle: none,
  authors: (),
  paper_link: none,
  abstract: none,
  thanks: none,
  JEL_codes: none,
  keywords: none,
  doc,
) = {
  // Global settings
  set page(margin: 2cm, 
           columns: 1)

  set text(font: "Palatino",
           size: 11pt)

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
  
  block()[
    #datetime.today().display("[month repr:long] [year]")
    
    #link(paper_link)[
    #text(fill: p_blue)[Latest Available Version]] 
    ]
    
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
      *JEL Clasification:* #JEL_codes\
      *Keywords:* #keywords
    ]
  line(length: 95%, stroke: 0.5pt)
  par(first-line-indent: 1em, leading: 0.35em, justify: true)[#text(size: 8pt)[\*#thanks]]

  pagebreak()
  
  // Main configs after the title page
  // colors

  // Heading settings
  set heading(numbering: "1.1")

  // show heading.where(level: 1): it => [
  //   #set align(center)
  //   #set text(20pt, weight: "bold")
  //   #block(below: 1em)[#smallcaps(it.body)]
  //   ]
  // show heading.where(level: 2): it => [
  //   #set text(16pt, weight: "bold")
  //   #block[#it]
  //   ]

  // Link settings
  show link: set text(fill: p_blue)

  // Set figure settings
  set figure.caption(position: top)

  // Table settings?
  set table(stroke:none)

  // Paragraph settings
  set par(justify: false, first-line-indent:2em)
  
  // Editing Mode: Uncomment the next line to see the text with bigger paragraph spacing
  // set par(leading: 1.5em, spacing: 2em)

  // reset the page format to skip the number
  set page(margin: 2cm, columns: 1, numbering: "1")

  // whole doc bellow
  doc
}


