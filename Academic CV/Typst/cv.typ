#import "conf.typ": conf
// #import "@preview/fontawesome:0.5.0"

#let p_blue = rgb(15,82,186)
#let p_red =  rgb(172, 68, 37)

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

#show: conf.with(
  name: "Javier Gonzalez",
  orcid_number: "0009-0006-0821-5163",
  university: (name: "University of Zurich", 
               department: "Business Administration",
               address: "Plattenstrasse 14, CH-8032 Zurich, Switzerland"),
  email: "xxxxxx@uzh.ch",
  webpage: "https://jjgecon.github.io/",
  github: "jjgecon"
  )

= Academic Positions

#grid(
  columns: (3cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[2026 $-$], [*Postdoctoral Researcher*\
  Professorship of Management and Economics of Digital Transformation \ University of Zurich,  Switzerland],
)

= Education

#grid(
  columns: (3cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[2021 $-$ 2026], [*Ph.D in Economics* \ Southern Methodist University, USA],
  text()[2015 $-$ 2020], [*B.A. and M.A. in Economics* \ Universidad Adolfo Ibáñez, Chile],
)

= Research

*Research Interests*: Culture Economics, Gender Economics, and Political Economy.

== Publications
+ #link("https://doi.org/10.1093/ej/ueab065")[#text(fill: p_blue)["The Reproducibility and Robustness of Economics and Political Science"]] joint with Brodeur et. al. _Nature_, 2026. #link("https://i4replication.org/")[#text(fill: p_blue)[I4R] Meta Paper] \*I contributed by replicating #link("https://doi.org/10.1093/ej/ueab065")[Dickens (2022)]
+ #link("https://doi.org/10.1111/ecin.13269")[#text(fill: p_blue)["Trade and Ethnolinguistic Differences: A Replication and Extension"]] joint with #link("http://omerozak.com/")[Ömer Özak]. _Economic Inquiry_, 2024
+ #link("https://doi.org/10.1515/bejm-2021-0125")[#text(fill: p_blue)["Aggregate Costs of a Gender Gap in Access to Business Resources"]] joint with #link("https://sites.google.com/site/franciscoparro1/home?authuser=0")[Francisco Parro]. _The B.E. Journal of Macroeconomics_, 2022

// #pagebreak()

== Working Papers
+ #link("https://jjgecon.github.io/assets/papers/JMP_Gonzalez_FEI_Telenovelas.pdf")[#text(fill: p_blue)["Does Watching Women Work, Work?: The Effect of Mexican Telenovelas on Female Labor Participation"]]
  
  // #text(size: 7pt)[*Abstract:*
  //   I study the effect of female empowerment in media on female labor market outcomes using Latin American telenovelas.
  //   Using generative AI, I construct a Female Empowerment Index (FEI) for these TV shows from 1960 to 2024.
  //   I show that FEI exposure during the impressionable years increases the likelihood of labor force participation among Latin American women.
  //   To identify the causal effect of FEI exposure, I implement an instrumental variables strategy using detailed data on television signal coverage in Mexico.
  //   The causal estimates confirm the positive effect of FEI exposure, with an effect size comparable to previous studies.
  //   Furthermore, FEI changes account for a significant fraction of the aggregate increase in female labor force participation observed over this period.
  //   Moreover, both the emotional framing of narratives and the types of jobs depicted play an important role in shaping the effects.
  // ]

+ "Drama and Redistribution: The Impact of Telenovelas on Preferences for Redistribution in Latin America"

  // #text(size: 7pt)[*Abstract:*
  //   This paper examines how telenovelas depicting inequality affect support for redistribution in Latin America. Using a novel dataset of telenovelas aired from 1960 to 2024 in the region, I employed three Natural Language Processing methods to identify inequality telenovelas. My analysis focuses on instances where a new inequality telenovela is introduced during the LAPOP's fieldwork, ensuring that no other inequality telenovelas are simultaneously airing. Consistently, I observe a 4% reduction in support for redistribution following exposure to such telenovelas. These narratives seem to misrepresent the problems of inequality, portraying fewer issues than are present in reality, making individuals adjust their policy priorities. This study provides evidence of how entertainment media can shape the perceptions of inequality, thereby influencing policy preferences.
  //   ]

// #v(0.5cm)

== Work in Progress
+ "Culture, Identity, and Conflict" joint with #link("https://people.smu.edu/kdesmet/")[Klaus Desmet] and #link("http://omerozak.com/")[Ömer Özak]
+ "Telenovelas as Cultural Mirrors: Revealing Social Values Through Generative AI"
+ "Misallocation of Gender Norms"
+ "Telenovelas and  Deforestation" joint with #link("https://ivandelasheras.github.io/")[Ivan de las Heras] and Leonardo Sepulveda
+ "Multiple Talent Misallocation" joint with #link("https://rouzl.github.io/")[Rouzhi Liang]
+ "Cesarean Informed Consents in Chile" joint with #link("https://sites.google.com/site/nievesvaldes/Home?authuser=0")[Nieves Valdes], #link("https://sites.google.com/site/florenciaborresciohiga/")[Florencia Borrescio], and #link("https://www.uai.cl/profesores/gorka-navarrete")[Gorka Navarrete] 

// #v(0.5cm)
// #pagebreak()

= Teaching
=== Southern Methodist University
#grid(
  columns: (3.5cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[_Lecturer:_], [Intermediate Microeconomics (#link("https://jjgecon.github.io/assets/class_files/ECO3301_Summer23/Student_Evals.pdf")[#text(fill: p_blue)[evaluation]])],
  text()[_Teaching assistant:_], [Macroeconomics (Ph.D.), Quantitative Economics (Ph.D.), Intermediate Macroeconomics, Urban Economics, Applied Econometric Analysis, Strategic Behavior, Financial Economics, and Economic Growth.],
)
=== Universidad Adolfo Ibáñez (Chile)
#grid(
  columns: (3.5cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[_Teaching assistant:_], [Macroeconomics II (M.A.), Mathematical Methods for Economists (M.A.), Gender Economics, Game Theory, Econometrics II, Economic Growth, and Macroeconomics],
)
=== Universidad de los Andes (Chile):

#grid(
  columns: (3.5cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[_Teaching assistant:_], [Macroeconomics II],
)

// #v(0.5cm)

= Invited Presentations and Conferences \ #text(size: 8pt, weight: "regular")[#sym.dagger  _indicate online presentations or webinars_]
#grid(
  columns: (3cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[2026], [Pontificia Universidad Católica, Chile$""^#sym.dagger$; Universidad de los Andes, Colombia; UNSW Sydney, Australia$""^#sym.dagger$; University of Zurich, Switzerland$""^#sym.dagger$; Banco de la República, Colombia$""^#sym.dagger$],
  text()[2025], [Southern Economic Association 95th Annual Meeting, USA; NTxEC, University of Texas at Arlington, USA; R&I Week Graduate, Southern Methodist University, USA; Universidad Adolfo Ibáñez, Chile$""^#sym.dagger$],

  text()[2024], [Southern Economic Association 94th Annual Meeting, USA],
  text()[2021], [12th Annual Meeting of the Chilean Public Policy Society, Poster Session$""^#sym.dagger$],
  text()[2020], [Chilean Economic Association (SECHI), Thesis Presentation (Only Speaker)$""^#sym.dagger$; Annual Meeting of the Chilean Economic Association (SECHI), Poster Session$""^#sym.dagger$],
)

// #pagebreak()

= Awards, Grants, and Fellowships
#grid(
  columns: (3cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[2025 ], [Service Melody Rice Memorial Award, Southern Methodist University (\$250)],
  text()[2024], [Dedman College Interdisciplinary Institute's Inaugural Graduate Student Summer Research and Writing Fellowship, Southern Methodist University (\$3000)],
  text()[2023 $-$ 2026], [Provost’s Doctoral Candidacy Fellowship, Southern Methodist University],
  text()[2021 $-$ 2023], [Full Tuition Scholarship and Teaching Assistantship, Southern Methodist University],
  text()[2021], [Poster Award at the 12th Annual Meeting of the Chilean Public Policy Society],
  text()[2020], [Highest GPA of the M.A. cohort, Universidad Adolfo Ibáñez],
  text()[2020], [Best Thesis Award at the Annual Meeting of the Chilean Economic Association],
  text()[2015 $-$ 2020], [Academic Excellence Scholarship “Pedro Luis Gonzalez”, Universidad Adolfo Ibáñez (\$13,000)],
)

= Academic Service

== Refereeing

#emph(lorem(50))

== Student Supervisions

#grid(
  columns: (3cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[2026 $-$ ], [XXXXX, B.Sc. Thesis in Digital Economics,University of Zurich ],
  text()[], [YYYYY, M.Sc. Thesis in Digital Economics, University of Zurich],
)

== Service
#grid(
  columns: (3cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[2025 $-$ 2026], [Peer-to-Peer AI for Research Cohort in Economics, SMU],
  text()[2025 $-$ 2026], [Mentor, ISTC Mentor Matching Engine],
  text()[2024 $-$ 2025], [Tutor, Academic SMU Development of Student-Athletes],
  text()[2023 $-$ 2025], [President, SMU Economics Graduate Club],
  text()[2022 $-$ 2025], [Organizer, SMU Graduate Student Mentorship Program],
)



#v(0.5cm)

= Affiliations
#grid(
  columns: (3cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[2022 $-$ ], [Omicron Delta Epsilon National Honor Society in Economics],
)

= Other
#grid(
  columns: (3cm, 1fr),
  row-gutter: 10pt,
  rows: (auto, auto, auto),
  align: (left, left),
  text()[Citizenship], [Spain, Chile, Guatemala, and Venezuela],
  text()[Languages], [English (fluent), Spanish (native), German (basic)],
  text()[Software Skills], [Julia, Python, MATLAB, Stata, Typst, and #LaTeX ],
  text()[Certificates], [NVIDIA: Fundamentals of Deep Learning],
  text()[], [NVIDIA: Fundamentals of Accelerated Data Science],
  text()[], [Constellate: Introduction to Vector Databases and Semantic Searching],
  text()[], [Constellate: Automated Text Classification Using LLMs],
  text()[], [Constellate: Large Language Models and Embeddings for Retrieval Augmented Generation],
  text()[], [Constellate: spaCy in the World of LLMs],
  text()[], [Constellate: Small Language Models],
)

#v(0.5cm)

// = References

// #align(center)[
// #set text(size: 9pt)
// #grid(
//   columns: (1fr,1fr),
//   row-gutter: 8pt,
//   column-gutter: 12pt,
//   [#text(size: 12pt)[Ömer Özak]], [#text(size: 12pt)[Klaus Desmet]],
//   [Southern Methodist University],[Southern Methodist University],
//   [Economics Department],[Economics Department],
//   [#link("mailto:ozak@smu.edu")], [#link("mailto:kdesmet@smu.edu")],
//   [],[],
//   [],[],
//   [#text(size: 12pt)[Luis Aguiar]], [#text(size: 12pt)[Wookun Kim]],
//   [University of Zurich],[Southern Methodist University],
//   [Management & Economics of Digital Transformation],[Economics Department],
//   [#link("mailto:luis.aguiar@business.uzh.ch")], [#link("mailto:wookunkim@smu.edu")],
// )]