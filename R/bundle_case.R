#' Assign most common-case variants of case-insensitive clusters to all observations
#'
#' Where names/entities/themes/tags/etc are referenced with multiple variations of upper/lower/title/mixed case, it is often desirable to group these case-insensitively for analysis.  This function does so while preserving the most common case for prettier reading and to avoid the need for subsequent look-ups.
#'
#' @param x A character vector
#' @return A character vector of same length as input, with case variants changed to the mode
#' @examples
#' bundle_case(c('london','London','London','Paris','PARIS','paris','Paris'))
#' @author Robin Edwards
#' @aliases bundle_case
#' @export

## Bundle case variations into most common variant y'all

bundle_case <- function(x){
  Mode <- function(v) { uv <- unique(v); uv[which.max(tabulate(match(v, uv)))]}
  tibble::enframe(x, name = NULL) %>%
    dplyr::mutate(value_lc = tolower(value)) %>%
    dplyr::group_by(value_lc) %>% dplyr::mutate(mode = Mode(value)) %>%
    dplyr::ungroup() %>% .[['mode']]
}
