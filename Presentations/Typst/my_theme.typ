// This theme is from https://github.com/andreasKroepelin/polylux/blob/main/themes/simple.typ
// Author: Andreas Kröpelin
// Modified by Javier Gonzalez
#import "@preview/touying:0.6.1": *

// Custom functions
#let p_red =  rgb(172, 68, 37)
#let p_blue = rgb(15,82,186)
#let p_green = rgb(79, 121, 66)
#let p_yellow = rgb(186,137,104)

// linkbox
#let linkbox(ref) = {
  set text(10pt, fill: white, weight: "bold")
  box(fill: rgb("#919191"), inset: 5pt, radius: 5pt)[#ref]
  }

// TODO: Figure out how to do this better
#let r_strong(content) = {text(fill: p_red, weight: "bold", content)}


/// Default slide function for the presentation.
///
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For more several configurations, you can use `utils.merge-dicts` to merge them.
///
/// - repeat (int, auto): The number of subslides. Default is `auto`, which means touying will automatically calculate the number of subslides.
///
////   The `repeat` argument is necessary when you use `#slide(repeat: 3, self => [ .. ])` style code to create a slide. The callback-style `uncover` and `only` cannot be detected by touying automatically.
///
/// - setting (function): The setting of the slide. You can use it to add some set/show rules for the slide.
///
/// - composer (function): The composer of the slide. You can use it to set the layout of the slide.
///
///   For example, `#slide(composer: (1fr, 2fr, 1fr))[A][B][C]` to split the slide into three parts. The first and the last parts will take 1/4 of the slide, and the second part will take 1/2 of the slide.
///
///   If you pass a non-function value like `(1fr, 2fr, 1fr)`, it will be assumed to be the first argument of the `components.side-by-side` function.
///
///   The `components.side-by-side` function is a simple wrapper of the `grid` function. It means you can use the `grid.cell(colspan: 2, ..)` to make the cell take 2 columns.
///
///   For example, `#slide(composer: 2)[A][B][#grid.cell(colspan: 2)[Footer]]` will make the `Footer` cell take 2 columns.
///
///   If you want to customize the composer, you can pass a function to the `composer` argument. The function should receive the contents of the slide and return the content of the slide, like `#slide(composer: grid.with(columns: 2))[A][B]`.
///
/// - bodies (array): The contents of the slide. You can call the `slide` function with syntax like `#slide[A][B][C]` to create a slide.
#let slide(
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  let deco-format(it) = text(size: .6em, fill: gray, it)
  let header(self) = deco-format(
    components.left-and-right(
      utils.call-or-display(self, self.store.header),
      utils.call-or-display(self, self.store.header-right),
    ),
  )
  let footer(self) = {
    v(.5em)
    deco-format(
      components.left-and-right(
        utils.call-or-display(self, self.store.footer),
        utils.call-or-display(self, self.store.footer-right),
      ),
    )
  }
  let self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
    config-common(subslide-preamble: self.store.subslide-preamble),
  )
  touying-slide(self: self, config: config, repeat: repeat, setting: setting, composer: composer, ..bodies)
})


/// Centered slide for the presentation.
/// 
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For more several configurations, you can use `utils.merge-dicts` to merge them.
#let centered-slide(config: (:), ..args) = touying-slide-wrapper(self => {
  touying-slide(self: self, ..args.named(), config: config, align(center + horizon, args.pos().sum(default: none)))
})


/// Title slide for the presentation. You should update the information in the `config-info` function. You can also pass the information directly to the `title-slide` function.
///
/// Example:
///
/// ```typst
/// #show: university-theme.with(
///   config-info(
///     title: [Title],
///     logo: emoji.school,
///   ),
/// )
///
/// #title-slide(subtitle: [Subtitle])
/// ```
/// 
/// - config (dictionary): is the configuration of the slide. Use `config-xxx` to set individual configurations for the slide. To apply multiple configurations, use `utils.merge-dicts` to combine them.
///
/// - extra (string, none): is the extra information for the slide. This can be passed to the `title-slide` function to display additional information on the title slide.
#let title-slide(
  config: (:),
  extra: none,
  ..args,
) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config,
    config-common(freeze-slide-counter: true),
  )
  let info = self.info + args.named()
  info.authors = {
    let authors = if "authors" in info {
      info.authors
    } else {
      info.author
    }
    if type(authors) == array {
      authors
    } else {
      (authors,)
    }
  }
  let body = {
    if info.logo != none {
      place(right, text(fill: black, info.logo))
    }
    std.align(
      center + horizon,
      {
        block(
          inset: 0em,
          breakable: false,
          { 
            set par(spacing: 0.4em)
            text(size: 2em, fill: black, weight: "bold")[#info.title]
            if info.subtitle != none {
              parbreak()
              text(size: 1.2em, fill: black, info.subtitle)
            }
          },
        )

        if info.emoji_summary != none {
          par()[
          #set text(size: 3em)
          #info.emoji_summary
          ]
        }
        

        v(1em)
        set text(size: .8em)
        grid(
          columns: (1fr,) * calc.min(info.authors.len(), 3),
          column-gutter: 1em,
          row-gutter: 1em,
          ..info.authors.map(author => text(fill: self.colors.neutral-darkest, author))
        )
        // v(1em)
        if info.institution != none {
          parbreak()
          text(size: .9em, info.institution)
        }
        if info.date != none {
          parbreak()
          text(size: .8em, utils.display-info-date(self))
        }
      },
    )
  }
  touying-slide(self: self, body)
})



/// New section slide for the presentation. You can update it by updating the `new-section-slide-fn` argument for `config-common` function.
/// 
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For more several configurations, you can use `utils.merge-dicts` to merge them.
#let new-section-slide(config: (:), body) = centered-slide(config: config, [
  #text(1.2em, weight: "bold", utils.display-current-heading(level: 1))

  #body
])

// TODO: need to add this slide that doesn't header and does not count to the slide number
/// Focus on some content.
///
/// Example: `#focus-slide[Wake up!]`
/// 
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For more several configurations, you can use `utils.merge-dicts` to merge them.
#let appendix-slide(config: (:), background: auto, foreground: white, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
  )
  touying-slide(self: self, config: config, body)
})

/// Focus on some content.
///
/// Example: `#focus-slide[Wake up!]`
/// 
/// - config (dictionary): The configuration of the slide. You can use `config-xxx` to set the configuration of the slide. For more several configurations, you can use `utils.merge-dicts` to merge them.
/// 
/// - background (color, auto): The background color of the slide. Default is `auto`, which means the primary color of the slides.
/// 
/// - foreground (color): The foreground color of the slide. Default is `white`.
#let focus-slide(config: (:), background: auto, foreground: white, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(fill: if background == auto {
      p_green
    } else {
      background
    }),
  )
  // here add the config methods?
  set text(fill: foreground, size: 1.5em)
  // UNCOMMENT if you want the heading to be in Small Caps
  // show heading: it => smallcaps(it)
  touying-slide(self: self, config: config, align(center + horizon, body))
})


/// Touying simple theme.
///
/// Example:
///
/// ```typst
/// #show: simple-theme.with(aspect-ratio: "16-9", config-colors(primary: blue))`
/// ```
///
/// The default colors:
///
/// ```typst
/// config-colors(
///   neutral-light: gray,
///   neutral-lightest: rgb("#ffffff"),
///   neutral-darkest: rgb("#000000"),
///   primary: aqua.darken(50%),
/// )
/// ```
///
/// - aspect-ratio (string): The aspect ratio of the slides. Default is `16-9`.
///
/// - header (function): The header of the slides. Default is `self => utils.display-current-heading(setting: utils.fit-to-width.with(grow: false, 100%), depth: self.slide-level)`.
///
/// - header-right (content): The right part of the header. Default is `self.info.logo`.
///
/// - footer (content): The footer of the slides. Default is `none`.
///
/// - footer-right (content): The right part of the footer. Default is `context utils.slide-counter.display() + " / " + utils.last-slide-number`.
///
/// - primary (color): The primary color of the slides. Default is `aqua.darken(50%)`.
///
/// - subslide-preamble (content): The preamble of the subslides. Default is `block(below: 1.5em, text(1.2em, weight: "bold", utils.display-current-heading(level: 2)))`.
#let simple-theme(
  aspect-ratio: "16-9",
  header: none,
  header-right: self => self.info.logo,
  footer: none,
  footer-right: context utils.slide-counter.display() + " / " + utils.last-slide-number,
  // Define theme colors with defaults
  primary: black,  // Default is green
  subslide-preamble: none,
  show-bibliography: false, // New parameter to control bibliography visibility
  ..args,
  body,
) = {
  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: 2em,
      footer-descent: 0em,
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
      zero-margin-header: false,
      zero-margin-footer: false,
    ),
    config-methods(
      init: (self: none, body) => {
        // default font size and font
        set text(font: "Lato", size: 20pt)

        // set default math font
        // show math.equation: set text(font: "Garamond-Math")

        // heading size
        show heading.where(level: 1): it => {
        set text(1.2em)
        set block(spacing: 1.5cm)  // Adds vertical spacing
        it                         // Returns the modified content
      }
        show heading.where(level: 2): set text(1em)

        // footnote
        show footnote.entry: set text(size: .6em)

        // list spacing
        set list(spacing: 1.2em)

        // cite
        show cite: set text(size: .6em)

        // Hide bibliography if show-bibliography is false
        show bibliography: it => {
          if self.store.show-bibliography {
            it
          }
        }

        // Set the default color for links
        show link: set text(fill: p_blue) 

        body
      },
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      neutral-light: gray,
      neutral-lightest: rgb("#ffffff"),
      neutral-darkest: rgb("#000000"),
      primary: primary,
    ),
    // save the variables for later use
    config-store(
      header: header,
      header-right: header-right,
      footer: footer,
      footer-right: footer-right,
      subslide-preamble: subslide-preamble,
      show-bibliography: show-bibliography,
    ),
    ..args,
  )

  body
}



