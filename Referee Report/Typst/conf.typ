#import "@preview/elembic:1.1.1" as e: field, types
#import "@preview/dashy-todo:0.1.3": todo
#import "@preview/showybox:2.0.4": showybox

#let p_red =  rgb(172, 68, 37)
#let p_blue = rgb(15,82,186)
#let p_green = rgb(79, 121, 66)
#let p_yellow = rgb(186,137,104)

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

#let sentence_start = e.element.declare(
  "sentence_start",
  doc: "sentence start similar to LaTeX",
  prefix: "@preview/my-package,v1",
  display: it => text(weight: "bold")[#it.body #h(.2cm)] ,
  fields: (
    field("body", types.option(content), doc: "Box contents", required: true),
  ),
)

#let conf(
  submission_n: none,
  title: none,
  subtitle: none,
  authors: none,
  doc,
) = {
  // Global settings
  let my_footer = if authors != none {
    set text(10pt)
    emph(authors.join(", "))
  } else {
    ""
  }

  set page(margin: 2cm, 
           columns: 1,
           height: 11in,
           width: 8.5in,
           numbering: "1",
           footer: my_footer)

  set text(font: "Palatino Linotype",
           size: 11pt)

  // set align(center)
  par(text(18pt, title + subtitle))

  set footnote(numbering: "*")

  if submission_n != none {
    [Submission #text(12pt, emph(submission_n)) reviewed on #datetime.today().display("[month repr:long] [year]")#footnote[During the preparation of this work the author used generative AI models (e.g. Gemini, Github Copilot, and Undermind) in order to check grammar and spelling, search for related literature. After using this tool/service, the author reviewed and edited the content as needed and take full responsibility for the content of the publication.]]
  }

  set footnote(numbering: "1")

  v(.5cm)

  // Heading settings
  set heading(numbering: "1.1")

  show heading.where(level: 1): it => [
    #set align(left)
    #set text(weight: "bold")
    #block(below: 1em)[#it.body]
  ]

  show heading.where(level: 2): it => [
    #set align(left)
    #set text(weight: "bold")
    #block(below: 1em)[#it]
  ]

  // Link settings
  show link: set text(fill: p_blue)

  // Set figure settings
  set figure.caption(position: top)

  // Table settings?
  set table(stroke:none)

  // Paragraph settings
    // Paragraph settings
  set par(justify: true, 
          first-line-indent:1em, 
          leading: 1.5em, 
          spacing: 2em
          )
          
  set align(left)
  // Editing Mode: Uncomment the next line to see the text with bigger paragraph spacing
  // set par(leading: 1.5em, spacing: 2em)

  // numbering of equations
  set math.equation(numbering: "(1)")
  
  // whole doc bellow
  doc
}