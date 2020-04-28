# Tools to facilitate text analysis and NLP

### Installation

    devtools::install_github('geotheory/textools')

#### %IN%

Special operator to enable case-insensitive implementation of Python-style string-in-text check.

```
require(textools)
#> Loading required package: textools
'cat' %IN% "The Cat in a Hat"
#> [1] TRUE
c('cat', 'fox') %IN% "The Cat in a Hat"
#> [1]  TRUE FALSE
'cat' %IN% c('The Cat in a Hat', 'Fox in Socks')
#> [1]  TRUE FALSE

require(dplyr)
d = starwars %>% select(name) %>% as.data.frame()

d %>% filter('sky' %IN% name)
#>               name
#> 1   Luke Skywalker
#> 2 Anakin Skywalker
#> 3   Shmi Skywalker

d %>% filter('[0-9]' %IN% name) # regex
#>     name
#> 1  C-3PO
#> 2  R2-D2
#> 3  R5-D4
#> 4  IG-88
#> 5 R4-P17
#> 6    BB8
```

#### str_detect_multi

Check if any of a vector of strings are matched case-wise in another string vector:

```
x = rownames(USJudgeRatings)
x[ str_detect_multi(x, c("^a", "o'", "(?<=,)j")) ]
#>  [1] "AARONSON,L.H."   "ALEXANDER,J.M."  "ARMENTANO,A.J."
#>  [4] "BRACKEN,J.J."    "DALY,J.J."       "DANNEHY,J.F."
#>  [7] "MCGRATH,J.F."    "O'BRIEN,F.J."    "O'SULLIVAN,T.J."
#> [10] "RUBINOW,J.E."    "SHEA,J.F.JR."    "SPEZIALE,J.A."
#> [13] "STAPLETON,J.F."
```

#### bundle_case

Reassign case variations of case-insensitive groups with the most common variant:

```
bundle_case(c('london','London','London','Paris','PARIS','paris','Paris'))
#> [1] "London" "London" "London" "Paris"  "Paris"  "Paris"  "Paris"
```
