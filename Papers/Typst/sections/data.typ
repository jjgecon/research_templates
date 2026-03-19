#import "../conf.typ": *

// ---------------------------------------------------------------- //


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
    #include("../../../0_media/ensamble_heterogeneity.typ")
  ] // used to reduce the width of the table 
  #fig_notes(width: 90%)[
    The outcome variable is the individuals answer to the following statement: “The (Country) government should implement strong policies to reduce income inequality between the rich and the poor.” An answer of 7 indicates strong agreement and 1 strong disagreement with the previous statement. I consider respondent with Income < 100 if they earn less than 100 U.S. dollars every month, and those that Perc. Low Class if they classify themselves as low-middle class or low class. Left Wing are those individuals that have a political leaning from 1 (left) to 10 (right) less than 4. High Political Interest refers to those individuals that have at least some interest in politics. Controls: gender, age, urban, employment status, education, religion, income, marital status, and a time trend. Clustered standard errors at the interview date level are showed in parenthesis.]
    ] 
  ]
  ] 

Therefore, what I do is to assume that station characteristics change little overtime (strong assumption), location stay the same overtime (another strong assumption)#footnote()[However it might be good to show something around here, how much do they change with some municipal data or show what happens overtime to some locations using the localidades of 2020 as fixed points], and the people don't move around too much at the localidad level (agin strong)#footnote[This might not seem as bad with some data of the census, but also could be capture the spillover effects, so that we capture this concern (at least somewhat) if we find something it might mean some internal migration or even that a small local market of sharing recorded telenovelas]

#sentence_start[Labor Market]
#lorem(50)

#todo(position: "inline")[Another drafting note that will appear in the outline]

Localidad data comes from the National Institute of Statistics and Geography (INEGI) Geo (INEGI) and Labor Market data comes from mexico's Central Bank EconLab's Local Labor Markets micro data available in #link("https://www.banxico.org.mx/DataSetsWeb/dataset?ruta=LLM&idioma=en")[here] which combines both the National Survey of Occupation and Employment (ENOE) and the Census surveys in 1990, 2000, 2010, 2015, 2020.#todo[check to see if there are more years]