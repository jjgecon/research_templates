#import "conf.typ": *

#show: e.prepare()


// COMMENT THE NEXT 2 LINES TO HIDE THE DRAFTING NOTES AND OUTLINE
#outline(title: "TODOs", target: figure.where(kind: "todo"))

#show: conf.with(
  submission_n: "12345",
  title: [
    The Disney Princess Effect:
  ],
  subtitle: [
    Female Labor Decisions and Gender Stereotypes on TV   // Try to always add \* to the end
  ],
  authors: ()
)

= Summary

Using data from Uber drivers in the U.S. between January 2015 and March 2017, they estimate an earnings gender gap of 7% of Uber drivers in the U.S. and a 4% earnings gap of Uber drivers in the city of Chicago. Focusing on Chicago, the gap can be completely decomposed by the differences in when, where, and how fast male and women uber drivers drive. Male drivers tend to drive: (i) at the most profitable time (usually late at night), (ii) in zones where it's more profitable, and (iii) faster. These three components allow men to gain more on-the-job experience by completing more trips, thus enjoying the high returns to accumulated experience.

Uber is the ideal setting to explore the gender pay gap and labor market returns to experience. Uber pays their employees by a publicly known function that only depends on incentive schemes (e.g. target a number of trips per week and surge levels for time/place pairs), number of miles between pick up and accepts of a trip, number of miles for the trip, speed, and wait time for dispatch. This allows the authors to do a full decomposition of the earnings gap and study the gender gap in the context of no pay discrimination from the employer.

The authors can directly measure on-the-job experience (both how many hours they work per week and accumulated experience) which allows them to distinguish clearly from returns to accumulated experience and intensity of driver experience per week. They then show how typical proxies for on-the-job experience (age and age^2) can overstate the importance of the returns of work intensity. 

To address possible concerns, they replicate the results for other cities like San Francisco; they test to see if customers discriminate against their drivers or if drivers discriminate against their customers; they check to see the returns to speed for each gender and see if men drive in zones with higher crime rates of alcohol consumption (which could be completely explained by where they live).

= Major Comments

#todo(position: "inline")[something here]

The authors found a 7% gender earnings gap among Uber drivers in the U.S. and then claim to fully decompose it. Nonetheless, they later mention (for the first time on page 7) that the bulk of their analysis is based on the city of Chicago (4% gender earnings gap). This leads readers to believe that they are decomposing the entire U.S. gap, while they only do this exercise for some MSAs.

Uber doesn’t set incentive schemes for the city of Chicago, which is the only reason the authors provide to explain the choice of Chicago for their main decomposition. Other than that, the choice of this city seems arbitrary. Why not Detroit, Houston, or Atlanta for the main decomposition since they have similar earnings gender gaps? A deeper discussion about why they focused on one city should improve the paper.

When they analyze other cities like San Francisco, they find higher gaps (10% compared to 4%) in which the difference is completely explained by these incentive schemes. This implies that the gender gap in Uber drivers is not completely decomposed into their three categories, but it also is affected by these incentive schemes.

The paper could be improved in two ways. First by modifying the abstract and introduction to make clear which data has been used for the decomposition and discuss more in detail how the incentive schemes introduce heterogeneity in the earnings gap between different cities. Second, they could get closer to a U.S. decomposition creating a group of different cities to construct a 3-dimensional panel (week, driver, city) and introduce city fixed effects that could potentially absorb all the incentive scheme differences across cities. Although, given the authors warning, this might be computationally infeasible.

= Minor Comments
-	There is little discussion on how uber drivers get a negative return to work intensity (Section 3.3.1). Providing a plausible story could help readers understand the negative returns. As seen in @depetris-chauvin_facto_2020.
-	To provide more insight into the composition of tenure between genders they could present Figure 4 for January of each year within their sample (2015, 2016, and 2017). Changes in the composition of tenure over time might give some insight into how the gender gap evolves over time in the ridesharing industry.
-	In the conclusion, the authors state: "Importantly, we do not find women to be disadvantaged by three factors that one might expect to contribute to a gender wage gap: …, preferences or constraints affecting specific hours worked, …" Then they say that given "…, flexible environment of the gig economy, gender-based preferences/constraints (especially the value of time not spent at paid work and, for drivers, preferences for driving speed) can open gender earnings gaps." Rewording the preferences/constraints to specifics as hours worked and the value of time between gender could avoid any confusion.

#bibliography("My Library.bib", style: "econ.csl")
