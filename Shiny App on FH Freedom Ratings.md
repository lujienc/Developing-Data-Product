Shiny App on Freedom House Country Ratings
========================================================
author: lujienc
date: Jan. 18th, 2016

Background Information
========================================================
- This Shiny App generates Freeom House Ratings for user-specified country's political rights, civil liberty, and overall status of freedom in any given year between 1990 and 2014 
- All information is based on Freedom House's annual ratings using expert surveys
- Detailed information regarding the methodology of Freedom House's ratings can be found here (https://freedomhouse.org/report/freedom-world-2015/methodology)
- This Shiny App can be accessed here(https://lujienc.shinyapps.io/Projects/)

User Instructions
========================================================

- Using dropdown menus, users select the country and year they are interested in
- After clicking the "Submit" botton, users can see related Freedom House ratings

Altogether, this Shiny App covers 25 years and 205 societies in the world between 1990 and 2014.
- Both political rights and civil liberty are assessed using a 7-point scale, with a smaller value standing for a better situation
- Overall status of freemdom is assessed using a 3-point scale: Free (F), Partly Free (PF), and Not Free (NF)

Illustrations
========================================================
For instance, if users want to see how Mexico looked in 1990. Users simply use dropdown menus to select "Mexico" and "1990"; and click "Submit". Following results will be displayed:

- You have selected: Mexico
- You have choosen year: 1990
- FH rating for its political rights is: 4
- FH rating for its civil liberty is: 4
- FH rating for its overall freedom status is: PF

Basically, Mexico in 1990 was a Partly Free (PF) society. Its Freedom House ratings for political rights and civil liberty in 1990 were 4 and 4 respectively.

Conclusion
========================================================
- Using this Shiny App, users can easily get the Freedom House ratings of the country they are interested in for a given year
- Users do not need to download data files form the Freedom House website and to manually search for related information
- Further development of this Shiny App will add plotting fucntions, including time-series figures for any user-specified country
