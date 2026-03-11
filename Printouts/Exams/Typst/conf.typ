// Put here all the extra packages that you 
#import "@preview/elembic:1.1.1" as e: field, types
#import "@preview/dashy-todo:0.1.3": todo
#import "@preview/showybox:2.0.4": showybox

#let p_red =  rgb(172, 68, 37)
#let p_blue = rgb(15,82,186)
#let p_green = rgb(79, 121, 66)
#let p_yellow = rgb(186,137,104)

#let problem = e.element.declare(
  "problem",
  doc: "sentence start similar to LaTeX",
  prefix: "@preview/my-package,v1",
  reference: (
    supplement: [Problem],
    numbering: "1.1"
  ),
  display: it => [
    #text(weight: "bold")[Problem #e.counter(it).display(): #it.title (#it.points points)] 
    
    #it.body

    #let n = it.blank_pages

    #for _ in range(n) {
      pagebreak()
    }
  ],
  fields: (
    field("body", types.option(content), doc: "Problem description", required: true),
    field("points", types.option(str), doc: "Points for the problem", default: ""),
    field("title", types.option(str), doc: "Title for the problem", default: ""),
    field("blank_pages", types.option(int), doc: "number of blank pages for the exercise", default: 1),

  ),
)

// LaTeX logos
#let TeX = {
  set text(font: "New Computer Modern",)
  let t = "T"
  let e = text(baseline: 0.22em, "E")
  let x = "X"
  box(t + h(-0.14em) + e + h(-0.14em) + x)
}

#let LaTeX = {
  set text(font: "New Computer Modern")
  let l = "L"
  let a = text(baseline: -0.35em, size: 0.66em, "A")
  box(l + h(-0.32em) + a + h(-0.13em) + TeX)
}

//  add a similar to the LaTeX paragraph
#let sentence_start = e.element.declare(
  "sentence_start",
  doc: "sentence start similar to LaTeX",
  prefix: "@preview/my-package,v1",
  display: it => text(weight: "bold")[#it.body #h(.2cm)] ,
  fields: (
    field("body", types.option(content), doc: "Box contents", required: true),
  ),
)

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
  class: (),
  authors: (),
  total_points: none,
  solutions: none,
  instructions: none,
  doc,
) = {
  // Global settings
  set page(margin: 2cm, 
           columns: 1,
           numbering: "1")

 set text(font: "Palatino Linotype",
           size: 11pt)

  // Footnote settings
  show footnote.entry: it => {
    set align(left)
    set text(0.8em)
    set par(justify: true)
    // This 'it' represents the footnote content itself
    it
  }

  set footnote.entry(
    separator: align(left)[#line(length: 30%, stroke: 0.5pt)]
  )

  set align(center)
  par()[
  #set text(16pt)
  #title
  #footnote(numbering: "*")[During the preparation of this work the author used generative AI models (e.g. Gemini, Github Copilot, and Undermind) in order to check grammar and spelling, search for related literature, and coding support.After using this tool/service, the author reviewed and edited the content as needed and take full responsibility for the content of the publication.
    ]
  ]
  
  block()[
    #set text(14pt)
    // #datetime.today().display("[month repr:long] [year]")
    
    #par()[
      #class.name | #class.code | #class.semester \
      #authors.at(0).affiliation
    ]

    ]

  v(1cm)
  grid(columns:(auto, 1fr),column-gutter: .25cm, row-gutter: .7cm,
    align: (left,left + bottom),
    [Name:],[#line(length: 100%)],
    [Student ID:], [#line(length: 100%)],
    )
  
  v(1cm)


  let problem-selector = e.selector(problem)
  let cols = 5

  // The context block allows Typst to access the document state for the query
  context {
      let problems = query(problem-selector)
      let count = problems.len() // Optional, if you need to display the count elsewhere
      

      showybox(
      frame: (
        border-color: black,
        title-color: gray.lighten(70%),
        border-width: 1pt,
        inset: 1.1em,
      ),
      title-style: (
        color: black,
        weight: "regular",
        align: center
      ),
      title: [#text(18pt)[Total points: #h(.8cm) / #total_points]])[
        // #v(.2cm)
        #set align(center)
        #grid(
          columns: (3cm,) * cols,
          column-gutter: 10pt,
          row-gutter: 10pt,
          stroke: (thickness: .5pt, paint: black),
          inset: 6pt,
          
          // .enumerate() gives us an array of (index, element) pairs
          ..problems.enumerate().map(((i, p)) => [
            // i starts at 0, so we add 1 for the problem number
            Problem #(i + 1) \ 
            
            // Check for a title and display it if it exists
            #let title = p.at("title", default: none)
            
            #if title != none [
              _ #title _ \
            ]
            
            #v(1cm)
          ])
        )
      // #v(.2cm)
      ]
  }

  v(1cm)
  set align(left)

  [
  #text(weight: "bold", size: 1.1em)[Instructions:]  
  #set list(spacing: .8cm)
  #instructions]

  // par(first-line-indent: 1em, leading: 0.35em, justify: true)[#text(size: 8pt)]

  pagebreak()
  
  // Main configs after the title page
  // colors

  // Heading settings
  set heading(numbering: "1.1")

  show heading.where(level: 1): it => [
    #set align(left)
    #set text(weight: "bold", size: 1.25em)
    #block(below: 1em)[#it]
  ]

  show heading.where(level: 2): it => [
    #set align(left)
    #set text(weight: "bold", size: 1.25em)
    #block(below: 1em)[#it]
  ]

  // Link settings
  show link: set text(fill: p_blue)

  // Set figure settings
  set figure.caption(position: top)

  // Table settings?
  set table(stroke:none)

  // Paragraph settings
  set par(justify: true)
  
  // Editing Mode: Uncomment the next line to see the text with bigger paragraph spacing
  // set par(leading: 1.5em, spacing: 2em)

  // reset the page format to skip the number
  // set page(margin: 2cm, columns: 1, numbering: "1")

  // numbering of equations
  set math.equation(numbering: "(1)")

  // align the document to the left
  set align(left)

  // return to default list settings
  set enum(numbering: "a.")

  // whole doc bellow
  doc
}


