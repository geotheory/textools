#' Detect the presence or absence of multiple patterns in a string/vector
#'
#' A wrapper for stringr::str_detect to enable vectorised search against multiple terms, with regex and case_ignore applied by default
#'
#' @inheritParams stringr::str_detect
#' @inheritParams stringr::regex
#' @return A logical value or vector
#' @examples
#' x = rownames(mtcars)
#' x[str_detect_multi(x, c('merc','honda'))]
#'
#' require(dplyr)
#' starwars %>% filter(str_detect_multi(name, c('sky','darth')))
#' @author Robin Edwards
#' @aliases str_detect_multi
#' @export

## stringr::str_detect for multiple terms

str_detect_multi = function(strings, patterns, ignore_case = TRUE, regex = TRUE){
  FUN <- ifelse(regex, stringr::regex, stringr::fixed)
  match_sets <- purrr::map(patterns, ~ stringr::str_detect(strings, FUN(.x, ignore_case = ignore_case)))
  purrr::pmap_lgl(match_sets, any)
}
