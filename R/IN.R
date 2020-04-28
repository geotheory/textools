#' String in text (vectorised)
#'
#' A Python-style String in Text operator that ignores case.
#' Shorthand for str_detect(str, regex(q, ignore_case = TRUE)).
#' Either q or str must be a single value. The return is a logical value or vector if vectorised input is provided.
#'
#' @param q Regex pattern or vector of patterns to match against str
#' @param str Character value or vector to match q against
#' @return A logical value or vector
#' @examples
#' 'cat' %IN% "The Cat in a Hat"
#' c('cat', 'fox') %IN% "The Cat in a Hat"
#' 'cat' %IN% c('The Cat in a Hat', 'Fox in Socks')
#'
#' require(dplyr)
#' d = starwars %>% select(name) %>% as.data.frame()
#' d %>% filter('sky' %IN% name)
#' d %>% filter('[0-9]' %IN% name) # regex
#'
#' @author Robin Edwards
#' @aliases %IN%
#' @export

## A text-in operator for R
## '%IN%' <- function(q, str) stringr::str_detect(str, stringr::regex(q, ignore_case = TRUE))

`%IN%` <- function(q, str) stringr::str_detect(str, stringr::regex(q, ignore_case = TRUE))
