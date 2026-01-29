
#import "conf.typ": conf

#show: conf.with(
  title: [
    Does Watching Women Work, Work?
  ],
  subtitle: [
    The Effect of Television on Female Labor Outcomes\*   // Try to always add \* to the end
  ],
  authors: (
    (
      name: "Javier Gonzalez",
      affiliation: "Southern Methodist University",
      email: "gonzalezjj@smu.edu",
    ),
    
  ),
  paper_link: "https://jjgecon.github.io/assets/papers/JMP_Gonzalez_FEI_Telenovelas.pdf",
  abstract: [
  I study the effect of female empowerment in media on female labor market outcomes using Latin American telenovelas.
  Using generative AI, I construct a Female Empowerment Index (FEI) for these TV shows from 1960 to 2024.
  I show that FEI exposure during the impressionable years increases the likelihood of labor force participation among Latin American women.
  To identify the causal effect of FEI exposure, I implement an instrumental variables strategy using detailed data on television signal coverage in Mexico.
  The causal estimates confirm the positive effect of FEI exposure, with an effect size comparable to previous studies.
  Furthermore, FEI changes account for a significant fraction of the aggregate increase in female labor force participation observed over 2010-2020.
  Moreover, both the emotional framing of narratives and the types of jobs depicted play an important role in shaping the effects.
    ],
  thanks: [
    Thanks to Ömer Özak, Klaus Desmet, Wookum Kim, Ivan de las Heras, Rouzhi Liang, and Esteban Aleman for their feedback and support. Special thanks to Lucas Garcia dos Santos who helped in the validation sample in the early stages of the project. Leonardo Sepulveda and Amparo Olfos provided excellent research assistance.
    Special thanks to the SMU Economics Department Ph.D. students and staff, as well as the O'Donnell Data Science and Research Computing Institute, for providing access to high-performance computing resources.
    Leonardo Sepulveda provided excellent research assistance.
    ],
  JEL_codes: [D91, J16, J22, L82, Z13],
  keywords: [Media, Gender Gap, Social Norms, Latin America, Mass Media, Generative AI, Telenovelas],
)

#set par(justify: true)

= Introduction
Disney’s latest princess tales present protagonists who drive their own stories—solving challenges, leading communities, and pursuing personal growth—rather than waiting to be rescued. Empirical studies show that children who see these agency‑driven characters develop higher self‑esteem and expand their career aspirations.

This narrative evolution also mirrors broader conversations about gender equity and inclusion, allowing Disney to engage a more diverse global audience, unlock new merchandising and social media opportunities, and bolster its reputation as an innovative storyteller. In our analysis, exposure to these empowered figures corresponds with a 12% increase in women’s labor force participation and a notable shift in young viewers’ professional goals.#footnote[#lorem(20)]

What if I cite @domenech-arumi_neighborhoods_2023

#figure(
  image("../../analysis/tables_figures/figure_x.svg", width: 60%),
  caption: [TV coverage of the 2020 election by state],
  // placement: bottom
)

= Data

== Broadcast Data
Shapefiles on the station coverage come from the Institut of National Statitics in Mexico (INE) provided in shapefile format, containing the coverage for each station in 2020 to 2025. FOr reference I use the 2020 coverage data.

The channel rigths to broadacst have been sourced from Registro Público de Concesiones (RPC) from the Instituto Federal de Telecomunicaciones (IFT) where they keep a public documents about concession rights per station #link("https://rpc.ift.org.mx/vrpc")[here]. Using #link("https://www.atsc.org/wp-content/uploads/2020/04/La-televisio%CC%81n-de-la-Nueva-Generacio%CC%81n.pdf")["La televisión de la Nueva Generación"] was downloaded from the #link("https://www.atsc.org")[Advanced Television Systems Committee] as a starting point of consessions historical records from 2004-2019, I then extract the hiostory of which channels own the rights for each station overtime using these public legal documents to expand the coverage of the table to 1960-2025. Which include station level characteristics, allowing me to estimate signal strenght.

To get the EXCEL I used the Adobes pdf convertion to Excel format

Channel that own the rights to broadcast have been matched using the #link("https://es.wikipedia.org/wiki/Anexo:Canales_de_televisi%C3%B3n_en_M%C3%A9xico")[Wikipedia list] that list every station and which channels names broadcast there

Therefore, what I do is to assume that station characteristics change little overtime (strong assumption), location stay the same overtime (another strong assumption)#footnote()[However it might be good to show something around here, how much do they change with some municipal data or show what happens overtime to some locations using the localidades of 2020 as fixed points], and the people don't move around too much at the localidad level (agin strong)#footnote[This might not seem as bad with some data of the census, but also could be capture the spillover effects, so that we capture this concern (at least somewhat) if we find something it might mean some internal migration or even that a small local market of sharing recorded telenovelas]

== Labor Market

Localidad data comes from the National Institute of Statistics and Geography (INEGI) Geo (INEGI) and Labor Market data comes from mexico's Central Bank EconLab's Local Labor Markets micro data available in #link("https://www.banxico.org.mx/DataSetsWeb/dataset?ruta=LLM&idioma=en")[here] which combines both the National Survey of Occupation and Employment (ENOE) and the Census surveys in 1990, 2000, 2010, 2015, 2020.

#bibliography("../../bibliography/My Library.bib", style: "harvard-cite-them-right")