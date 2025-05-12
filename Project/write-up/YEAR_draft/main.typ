
#import "conf.typ": conf

#show: conf.with(
  title: [
    The Disney Princess Effect:
  ],
  subtitle: [
    Female Labor Decisions and Gender Stereotypes
  ],
  authors: (
    (
      name: "Javier Gonzalez",
      affiliation: "Southern Methodist University",
      email: "gonzalezjj@smu.edu",
    ),
    
  ),
  abstract: [
    #lorem(120)
    ],
  thanks: [
    Thanks to Omer Ozak, Klaus Desmet, Wookum Kim, Ivan de las Heras, Rouzhi XXX for their feedback and support.. Thanks to Leonardo Sepulveda for invaluable research assitance and support. Special thanks to the SMU Economics Department Ph.D. students  
    ],
)

#set par(justify: true)

= Introduction
Disney’s latest princess tales present protagonists who drive their own stories—solving challenges, leading communities, and pursuing personal growth—rather than waiting to be rescued. Empirical studies show that children who see these agency‑driven characters develop higher self‑esteem and expand their career aspirations.

This narrative evolution also mirrors broader conversations about gender equity and inclusion, allowing Disney to engage a more diverse global audience, unlock new merchandising and social media opportunities, and bolster its reputation as an innovative storyteller. In our analysis, exposure to these empowered figures corresponds with a 12% increase in women’s labor force participation and a notable shift in young viewers’ professional goals.#footnote[#lorem(20)]

What if I cite @domenech-arumi_neighborhoods_2023

#figure(
  image("../../analysis/tables_figures/example_female_labor_market.png", width: 60%),
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

#bibliography("My Library.bib", style: "harvard-cite-them-right")