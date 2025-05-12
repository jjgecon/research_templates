#import "my_theme.typ": *


// Apply the theme with your configuration
#show: simple-theme.with(
  aspect-ratio: "16-9", 
  config-page(
      header: none,
    ),
  config-common(
    show-bibliography: false,
  ),
  config-info(
    title: [Typst Presentation Template],
    subtitle: [With and without cool _emoji summary_],
    author: [Javier Gonzalez],
    date: datetime.today(),
    institution: [Southern Methodist University],
  )
)


// Title slide with Emoji summary
// for a emoji list you can look here https://typst.app/docs/reference/symbols/emoji/
#title-slide(authors: ([Javier Gonzalez]), emoji_summary: [#emoji.woman.crown #emoji.fairy #text(size:24pt)[vs.] #emoji.woman.crown #emoji.fist.front])

// Title slide without emoji summary, you can customize this if you want
#title-slide(authors: ([Javier Gonzalez]), emoji_summary: none)

#slide[
  = Why Typst?
  - Realtime preview, with faster compilation and more custimizable than LaTeX
  - Easy to use, with a simple syntax and a powerful set of features
  - Could be developed in VS Code with access to Copilot!
  - To learn more Typst go to #link("https://typst.app/docs/")[https://typst.app/docs/]
  - Presentations use the package #link("https://github.com/touying-typ/touying")[Touying] with a couple of different #link("https://github.com/touying-typ/touying/wiki")[themes].
  - This uses a modified version of the `simple` theme.
]

#slide[
  = Unlike LaTeX you can use `.gif` images
  So there is potential to add animations into your presentations!
  #figure(
    image("mindblow.gif", width: 50%)
  )
]

#slide[
  = Colors <main_colors>
  Note that color varaibles are placed #link("https://typst.app/docs/reference/layout/place/")[`#place`] and the general text color is set before the grid!
  #set align(center + horizon)
  #set text(fill: white)
  #grid(rows: (4.5cm, 4.5cm), columns: (1fr, 1fr), gutter: 3pt,
        rect(fill: p_green, height: 100%, width: 100%)[
          
          main color (colorblind friendly!)
          #place(top + left)[`p_green`]
        ], rect(fill: p_blue, height: 100%, width: 100%)[
          #block(fill: black, inset: 10pt)[
          #text(fill: gradient.linear(..color.map.rainbow))[You can color anything you want]]
          #place(top + right)[`p_blue`]
        ],
        rect(fill: p_yellow, height: 100%, width: 100%)[
          This also shows the #text(fill: p_blue)[power] of a grid and individual colors with `#text` and `#place`!
          #place(bottom + left)[`p_yellow`]
        ], rect(fill: p_red, height: 100%, width: 100%)[
          
          Some emojis + a change the font size  \ #text(50pt)[#emoji.airplane #emoji.anchor]#place(bottom + right)[`p_red`]
        ],
        )
]

#slide[
  = Math and colors
  - You can also use colors in math!
  
  ```typst
   $x = #text(fill: red)[$a + b + 10$] $
  ```
  #set text(30pt)
  $x = #text(fill: red)[$a + b + 10$] $

  $ #text(fill: p_red)[Area] &= pi * #text(fill: p_blue)[$4/1$] \
  b &= 23 + 64 #text(fill: p_green)[$sum_(i)^I$] $
]

#slide[
  = Bibliography links!

  You can also use your bibliography in `.bib` file so that you can cite:

  By default the references have a smaller font @singh_novel_2022 or #cite(<singh_novel_2022>, form: "prose") for anther style of  citation.

  Use #h(0.2cm) ```typ #show cite: set text(size: 2em, fill: p_yellow, weight: "bold")``` to change them to bigger font, change the color, and make it bold *inside* another `#par` to avoid changing all others!
  #par()[
  #show cite: set text(size: 2em, fill: p_yellow, weight: "bold")
  What did @singh_novel_2022 say?
  ]

  @alesina_preferences_2011  now is back to normal!
]

#appendix-slide()[
  = Slide with no counter!
  - This slide is called `appendix-slide` and it will not show the counter
  - I will also not show the number of slides in the footer
  - You can use this to add more content at the end of the presentation to suplement your slides and add buttons!
  - I placed a link botton to the main colors slide by the custom function `#linkbox`

  #align(center)[
  ```typst
  #linkbox()[
    #ref(<main_colors>, supplement: "to colors", form: "page")
  ]
  ```
  ]
  #place(left + bottom)[
    #linkbox()[
      #ref(<main_colors>, supplement: "to colors", form: "page")
  ]]
]

#focus-slide()[
  = Transition Slide!

  #text(12pt)[\*You can also add some other info here!, but it's not required]
]

#slide(composer: (2fr, 1fr))[
  = Two columns!
  - Set the lenght of the columns above!
  - `(2fr, 1fr)` shows that the first column should take up 2 parts of the space and the second column should take up 1 part of the space.
  - The picture on the right will be centered with the text on the left

][
    #set text(12pt)
    #show link: set text(fill: black)
    #place(center + horizon)[
    #v(1cm)
    #figure(
      image("test_img.jpeg", width: 100%),
      )  
    #link("https://ciudadmaravillosa.wordpress.com/2012/11/24/la-novela-de-las-ocho/")[some link with NO link color \ `#show link: set text(fill: black)` \ at the start of this columns] 
 ]
]

#slide(composer: (2fr, 1fr))[
  = Two columns!
  - Set the lenght of the columns above!
  - `(2fr, 1fr)` shows that the first column should take up 2 parts of the space and the second column should take up 1 part of the space.
  - Add more text!
  - #lorem(40)

][
    #set text(12pt)
    #show link: set text(fill: black)
    #place(center + horizon)[
    #v(1cm)
    #figure(
      image("test_img.jpeg", width: 100%),
      )  
    #link("https://ciudadmaravillosa.wordpress.com/2012/11/24/la-novela-de-las-ocho/")[some link with NO link color \ `#show link: set text(fill: black)` \ at the start of this columns] 
 ]
]

#slide(composer: (2fr, 1fr))[
  = `pause, meanwhile`
  - Use `#pause` to create a pause in the presentation _block_ #pause

  Not necesarrily a list or element it can be whatever #pause

  + What about a table?

  #align(center)[
  #block()[
    #set text(10pt)
    #include("internal_migration.typ")
  ]]
  
  #pause
  How about some math? $a = c + 10$
  
][  
    #meanwhile
    
    #show link: set text(fill: black)

    While `#meanwhile` is used to maintain in the same slide some content ignored by `#pause`

    #set text(12pt)

    #v(1cm)
    #figure(
      image("test_img.jpeg", width: 80%),
      )  
]

#slide[
  #counter(figure.where(kind: image)).update(0)
  #figure(
  image("test_img.jpeg", width: 80%), caption: "This is a caption for panel A", 
  )  
][
  #counter(figure.where(kind: image)).update(10)
  #figure(
    image("test_img.jpeg", width: 80%), caption: "Skip to figure 11 with `#counter`",
  )  
]

#slide[
  #counter(figure.where(kind: image)).update(0)
  #figure(
  image("test_img.jpeg", width: 80%), caption: "Roman Numerals!", numbering: "I"
  )  
][
  #figure(
    image("test_img.jpeg", width: 80%), caption: "No number", numbering: none,
  )  
]

#slide(composer: (1.3fr, 1fr), repeat: 5, self => [
  #let (uncover, only, alternatives) = utils.methods(self)
   = Complex slide
  #v(1cm)
  - This slide will change the text and the image
  #uncover("2-")[- Now the text will get bigger!]
  #uncover("3-")[- We control this with `#uncover` and `#only`]
  #uncover("4-")[- Now it's BIG!]
  #uncover("5-")[- The image Keeps the same size now!

  \* So you can mix and match with `#uncover` and `#only` to show different content in the same slide!
  ]
], self => [
  #set align(center + horizon)
  #only("1")[
    #set text(12pt)
    #figure(
      image("test_img.jpeg", width: 50%)
    )
  ]
  #only("2")[
    #set text(12pt)
    #figure(
      image("test_img.jpeg", width: 55%)
    )
  ]
  #only("3")[
    #set text(12pt)
    #figure(
      image("test_img.jpeg", width: 60%)
    )
  ]
  #only("4-5")[
    #set text(12pt)
    #figure(
      image("test_img.jpeg", width: 100%)
    )
  ]
])



#bibliography("My Library.bib", style: "apa")