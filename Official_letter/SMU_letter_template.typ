#import "conf.typ": *


#show: conf.with(
  uni_logo: "SMULogo_InformalPeruna_digitalonly_BR.png",
  uni_logo_size: 60%,
  university: "Southern Methodist University",
  college: "Deadman College of Humanities and Science",
  department: "Department of Economics",  
  recepient: [Recepient],
  author: (
      name: "Javier Gonzalez",
      address: "3300 Dyer Street, P.O. Box 0496; Dallas, TX 75275-0496, USA", // Always separate by `;` to create a new line
      email: "gonzalezjj@smu.edu",
      position: "Economics Ph.D. Candidate",
  ),
  main_c: smu_red,
  foot_here: [
            #set align(center)
            #text(fill: smu_red, weight: "bold")[
              World Changes Shaped Here
            ] \
            #text(size:9pt)[
              Southern Methodist University | PO Box 750116   |   Dallas TX 75275-0116   |   214-768-2562   |   Fax 214-768-1611
            ]
           ],
)

#lorem(250)

#lorem(250)

