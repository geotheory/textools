#' String in text (vectorised)
#'
#' The text-in operator
#'
#' @inheritParams stringr::str_detect
#' @inheritParams stringr::regex
#' @return A logical value or vector
#' @examples
#' x = rownames(mtcars)
#' x['merc' %IN% x]
#' x[ gsub(' .*', '', x) %IN% 'We have Mazdas and Fiats in stock' ]
#' x[purrr::map_lgl(x, ~ any(c('merc','fiat') %IN% .x))]
#' @author Robin Edwards
#' @aliases %IN%
#' @export

## The text-in operator for R
## '%IN%' <- function(q, str) stringr::str_detect(str, stringr::regex(q, ignore_case = TRUE))

`%IN%` <- function(q, str) stringr::str_detect(str, stringr::regex(q, ignore_case = TRUE))
