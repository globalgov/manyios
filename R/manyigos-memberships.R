#' memberships datacube
#' @description `r describe_datacube(manyigos::memberships)`.
#'   It is a work-in-progress, so please let us know if you have any comments or suggestions.
#' @format
#' \describe{
#' \item{MIGO: }{A dataset with `r prettyNum(nrow(manyigos::memberships$MIGO), big.mark=",")` 
#' observations and `r ncol(manyigos::memberships$MIGO)` variables: 
#' `r cli::pluralize("{names(manyigos::memberships$MIGO)}")`.}
#' \item{IIGO: }{A dataset with `r prettyNum(nrow(manyigos::memberships$IIGO), big.mark=",")` 
#' observations and `r ncol(manyigos::memberships$IIGO)` variables: 
#' `r cli::pluralize("{names(manyigos::memberships$IIGO)}")`.}
#' }
#' For more information and references to each of the datasets used,
#' please use the `manydata::call_sources()` and `manydata::compare_dimensions()` functions.
#' @source
#'   `r call_citations(memberships, output = "help")`
#' @section Mapping:
#' 
#' |  *manyigos*  | *MIGO*  | *IIGO* | 
#' |:---------------|:------|:------|
#' | igoID  | | Abbreviation|
#' | stateID  | | |
#' | StateName | state_name | |
#' | cowID | ccode | |
#' | Title | IIGO Name | |
#' 
#' @md
#' @details
#' ``` {r, echo = FALSE, warning = FALSE}
#' lapply(memberships, manydata::mreport)
#' ```
"memberships"

info_memberships <- tibble::tibble(Dataset = names(utils::data(memberships, package = "manyigos")),
                                     Source = c("",
                                                ""),
                                     URL = c("",
                                             ""))

