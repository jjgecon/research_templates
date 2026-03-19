#import "../conf.typ": *

// ---------------------------------------------------------------- //


Some math here just to check how does it look


$ y_(o w l c) = alpha*X^(prime)_(o w) + delta_(o w) + epsilon_(o w l c) $ <main_eq>

Even you can do colors in math!

$ x = #text(fill: p_red)[$a + b + 10$] $

Let @main_eq show, #lorem(200)

#figure(
  image("../test_img.jpeg", width: 30%),
  caption: [A curious figure.],
) <ai_figure>

#lorem(500)

As you can see in @ai_figure a representation of the main idea and in @internal_migration a table showing that internal migration is not a problem in mexico.

#figure(caption: [A curious table.])[
  #include("../internal_migration.typ")
  
  #fig_notes(lorem(50))

] <internal_migration>

Now  we can also add a simple box with @m_prompt #todo[might want to implement `block` with `elembic`]

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
    #image("../test_img.jpeg", width: 100%)
  ],
  figure(caption: [another curious figure.], supplement: [Panel], kind: "panel", numbering: "A")[
    #image("../test_img.jpeg", width: 100%)
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
    #image("../test_img.jpeg", width: 100%)
  ],
  figure(caption: [another curious figure.], supplement: [Panel], kind: "panel", numbering: "A")[
    #image("../test_img.jpeg", width: 100%)
  ],
  figure(caption: [yet another curious figure.], supplement: [Panel], kind: "panel", numbering: "A")[
    #image("../test_img.jpeg", width: 100%)
  ])
  #fig_notes(lorem(50))
 ]