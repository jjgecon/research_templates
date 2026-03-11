#import "conf.typ": *

// COMMENT THE NEXT 2 LINES TO HIDE THE DRAFTING NOTES AND OUTLINE
#outline(title: "TODOs", target: figure.where(kind: "todo"))

#show: conf.with(
  title: [
    The Disney Princess Effect:
  ],
  subtitle: [
    Female Labor Decisions and Gender Stereotypes on TV\*   // Try to always add \* to the end
  ],
  authors: (
    (
      name: "Javier Gonzalez",
      affiliation: "Southern Methodist University",
      email: "gonzalezjj@smu.edu",
    ),
    
  ),
  paper_link: "https://jjgecon.github.io/",
  abstract: [
    #lorem(120)
    ],
  thanks: [
    Thanks to Omer Ozak, Klaus Desmet, Wookum Kim, Ivan de las Heras, Rouzhi Liang for their feedback and support. 
    Thanks to Leonardo Sepulveda for invaluable research assistance and support. 
    Special thanks to the SMU Economics Department Ph.D. students and staff.
    ],
  JEL_codes: [H11, H23, N16, P16, L82],
  keywords: [ Redistribution, Media, Latin America, Inequality, Perceptions, Telenovelas ],
)

= Introduction
Disney’s latest princess tales present protagonists who drive their own stories—solving challenges, leading communities, and pursuing personal growth—rather than waiting to be rescued. Empirical studies show that children who see these agency‑driven characters develop higher self‑esteem and expand their career aspirations.

This narrative evolution also mirrors broader conversations about gender equity and inclusion, allowing Disney to engage a more diverse global audience, unlock new merchandising and social media opportunities, and bolster its reputation as an innovative storyteller. In our analysis, exposure to these empowered figures corresponds with a 12% increase in women’s labor force participation and a notable shift in young viewers’ professional goals.#footnote[#lorem(20)]

What if I cite @domenech-arumi_neighborhoods_2023 and then #cite(<singh_novel_2022>, form: "prose")

= Data

== Broadcast Data
Shapefiles on the station coverage come from the Institut of National Statitics in Mexico (INE) provided in shapefile format#todo[something here], containing the coverage for each station in 2020 to 2025. FOr reference I use the 2020 coverage data.

The channel rigths to broadacst have been sourced from Registro Público de Concesiones (RPC) from the Instituto Federal de Telecomunicaciones (IFT) where they keep a public documents about concession rights per station #link("https://rpc.ift.org.mx/vrpc")[here]. Using #link("https://www.atsc.org/wp-content/uploads/2020/04/La-televisio%CC%81n-de-la-Nueva-Generacio%CC%81n.pdf")["La televisión de la Nueva Generación"] was downloaded from the #link("https://www.atsc.org")[Advanced Television Systems Committee] as a starting point of consessions historical records from 2004-2019, I then extract the hiostory of which channels own the rights for each station overtime using these public legal documents to expand the coverage of the table to 1960-2025. Which include station level characteristics, allowing me to estimate signal strenght.

To get the EXCEL I used the Adobes pdf convertion to Excel format

Channel that own the rights to broadcast have been matched using the #link("https://es.wikipedia.org/wiki/Anexo:Canales_de_televisi%C3%B3n_en_M%C3%A9xico")[Wikipedia list] that list every station and which channels names broadcast there

// USE THIS CODE TO CREATE A WIDE TABLE THAT TAKES AN ENTIRE PAGE
// AND WRAPS THE TEXT AROUND IT
#figure(
  caption: none,
  placement: auto,
)[
  #rotate(-90deg, reflow: true)[
  #box(height: 100%, width: 100%)[

    // this is the title
    Table #context counter(figure.where(kind: table)).display(): Heterogeneous Effects of Exposure to an Inequality Telenovela

    #text(size: 8pt)[
    #include("../../0_media/ensamble_heterogeneity.typ")
  ] // used to reduce the width of the table 
  #fig_notes(width: 90%)[
    The outcome variable is the individuals answer to the following statement: “The (Country) government should implement strong policies to reduce income inequality between the rich and the poor.” An answer of 7 indicates strong agreement and 1 strong disagreement with the previous statement. I consider respondent with Income < 100 if they earn less than 100 U.S. dollars every month, and those that Perc. Low Class if they classify themselves as low-middle class or low class. Left Wing are those individuals that have a political leaning from 1 (left) to 10 (right) less than 4. High Political Interest refers to those individuals that have at least some interest in politics. Controls: gender, age, urban, employment status, education, religion, income, marital status, and a time trend. Clustered standard errors at the interview date level are showed in parenthesis.]
    ] 
  ]
  ] 

Therefore, what I do is to assume that station characteristics change little overtime (strong assumption), location stay the same overtime (another strong assumption)#footnote()[However it might be good to show something around here, how much do they change with some municipal data or show what happens overtime to some locations using the localidades of 2020 as fixed points], and the people don't move around too much at the localidad level (agin strong)#footnote[This might not seem as bad with some data of the census, but also could be capture the spillover effects, so that we capture this concern (at least somewhat) if we find something it might mean some internal migration or even that a small local market of sharing recorded telenovelas]

== Labor Market

#todo(position: "inline")[Another drafting note that will appear in the outline]

Localidad data comes from the National Institute of Statistics and Geography (INEGI) Geo (INEGI) and Labor Market data comes from mexico's Central Bank EconLab's Local Labor Markets micro data available in #link("https://www.banxico.org.mx/DataSetsWeb/dataset?ruta=LLM&idioma=en")[here] which combines both the National Survey of Occupation and Employment (ENOE) and the Census surveys in 1990, 2000, 2010, 2015, 2020.#todo[check to see if there are more years]

= Empirical Strategy

Some math here just to check how does it look


$ y_(o w l c) = alpha*X^(prime)_(o w) + delta_(o w) + epsilon_(o w l c) $ <main_eq>

Even you can do colors in math!

$ x = #text(fill: p_red)[$a + b + 10$] $

Let @main_eq show, #lorem(200)

#figure(
  image("test_img.jpeg", width: 30%),
  caption: [A curious figure.],
) <ai_figure>

As you can see in @ai_figure a representation of the main idea and in @internal_migration a table showing that internal migration is not a problem in mexico.

#figure(caption: [A curious table.])[
  #include("internal_migration.typ")
  
  #fig_notes(lorem(50))

] <internal_migration>

Now  we can also add a simple box with @m_prompt

#figure(caption: [asdasd], supplement: [Block], kind: "block")[
  #showybox(
    frame: (
      border-color: black,
      title-color: p_red.lighten(60%),
      border-width: 1pt,
    ),
    title-style: (
      color: black,
      weight: "regular",
      align: center
    ),
    title: [_Female Strong Woman_ prompt])[
    #set text(font: "Courier New", size: 10pt)
    #lorem(50) 
    ] 
] <m_prompt>

#figure(
  caption: [Overall figure caption]
)[ 
  #counter(figure.where(kind: "panel")).update(0)
  #set figure.caption(position: bottom)
  #v(0.2cm)
  #grid(
  columns: 2,
  gutter: 20pt,
  figure(caption: [a curious figure.], supplement: [Panel], kind: "panel", numbering: "A")[
    #image("test_img.jpeg", width: 100%)
  ],
  figure(caption: [another curious figure.], supplement: [Panel], kind: "panel", numbering: "A")[
    #image("test_img.jpeg", width: 100%)
  ],
)
 ]

#figure(
  caption: [Overall figure caption]
)[ 
  #counter(figure.where(kind: "panel")).update(0) // super important to reset the counter within each figure
  #set figure.caption(position: bottom)
  #v(0.2cm)
  #grid(
  columns: 3,
  gutter: 20pt,
  figure(caption: [a curious figure.], supplement: [Panel], kind: "panel", numbering: "A")[
    #image("test_img.jpeg", width: 100%)
  ],
  figure(caption: [another curious figure.], supplement: [Panel], kind: "panel", numbering: "A")[
    #image("test_img.jpeg", width: 100%)
  ],
  figure(caption: [yet another curious figure.], supplement: [Panel], kind: "panel", numbering: "A")[
    #image("test_img.jpeg", width: 100%)
  ])
  #fig_notes(lorem(50))
 ]

#bibliography("My Library.bib", style: "econ.csl")

// Appendix Begins here

#show heading.where(level: 1): it => [
  #set align(left)
  #set text(weight: "bold")
  #block(below: 1em)[#it.body]
]

= Appendix

#show: backmatter

// Some other conf for Appendix
#set figure(numbering: it => {
  //workaround...
  let appx = state("backmatter", false).get()
  let alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  let hdr = counter(heading).get().at(0)
  if appx [#alph.at(hdr - 1).#it]
  else [#hdr.#it]
})

#show heading.where(level: 1): hdr => {
  counter(figure.where(kind:image)).update(0)
  counter(figure.where(kind:table)).update(0)
  hdr
}

#counter(heading).update(0)
#show heading.where(level: 1): it => [
  #set align(left)
  #set text(weight: "bold")
  #block(below: 1em)[#context {counter(heading).display(it.numbering + ".")}#h(0.5em)#smallcaps(it.body)]
]

= Popular Telenovelas

#counter(figure.where(kind: image)).update(0)
#counter(figure.where(kind: table)).update(0)

#figure(
  image("test_img.jpeg", width: 30%),
  caption: [A curious figure.],
) 

= Second part of the appendix

#counter(figure.where(kind: image)).update(0)
#counter(figure.where(kind: table)).update(0)

= Some other apendix

#counter(figure.where(kind: image)).update(0)
#counter(figure.where(kind: table)).update(0)