
// Configuration Settings by Javier Gonzalez
// For an updates version please see https://github.com/jjgecon/research_templates

// Global settings
// colors
#let smu_red =  rgb(170, 18, 49)
#let smu_blue = rgb(52,67,148)

#let conf(
  uni_logo: none,
  uni_logo_size: 100%,
  university: none,
  college: none,
  department: none, 
  recepient: none,
  author: (),
  main_c: smu_red,
  foot_here: none,
  doc,
) = {

  // Header
  

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
  show link: set text(fill: smu_blue)

  // Set figure settings
  set figure.caption(position: top)

  // Table settings?
  set table(stroke:none)
  
  // reset the page format to skip the number
  set page(margin: (top: 5cm, bottom: 3.5cm, rest: 2cm), columns: 1, numbering: "1",
           header: [
            #grid(columns: (1fr, 2fr), align: (left, horizon + right), 
            [#image(uni_logo, width: uni_logo_size)],
            [#text(fill: main_c, weight: "bold")[
              #college] \ #department
            ])            
            ],
           footer: foot_here)

  set text(size: 12pt, font: "Palatino Linotype")
  datetime.today().display("[month repr:long] [day], [year]")
  par()[
    #set align(left)
    #author.name \
    #for addr in author.address.split(";") {
      addr.trim()
      linebreak()
    }
  ]

  v(0.6cm)

  par()[Dear #recepient:]

  set par(justify: true)

  // whole doc bellow
  doc

  // signature
  v(.5cm)
  [
    #set align(left)
    Kind regards, \
    #author.name \
    #author.position \
    #university \
    #author.email \
  ]
}