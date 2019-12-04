#' Assign most common-case variants of case-insensitive clusters to all observations
#'
#' Where entities or themes are referenced in the data in various ways with respect to case, it is often desirable to group these together for analysis.  This function does so while preserving the most common case for prettier reading and to avoid the need for look-ups when reporting or visualising.
#'
#' @inheritParams tibble::enframe
#' @inheritParams dplyr::mutate
#' @inheritParams dplyr::group_by
#' @inheritParams dplyr::ungroup
#' @inheritParams magrittr::`%>%`
#' @return A logical value or vector
#' @examples
#' bundle_case(c('london','London','London','Paris','PARIS','paris','Paris'))
#' @author Robin Edwards
#' @aliases bundle_case
#' @export

## Bundle case variations into most common variant

bundle_case = function(x){
  Mode <- function(v) { uv <- unique(v); uv[which.max(tabulate(match(v, uv)))]}
  tibble::enframe(x, name = NULL) %>%
    dplyr::mutate(value_lc = tolower(value)) %>%
    dplyr::group_by(value_lc) %>% dplyr::mutate(mode = Mode(value)) %>%
    dplyr::ungroup() %>% .[['mode']]
}
