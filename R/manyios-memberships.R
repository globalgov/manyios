#' memberships datacube
#' @description `r describe_datacube(manyios::memberships)`.
#'   It is a work-in-progress, so please let us know if you have any comments or suggestions.
#' @format
#' \describe{
#' \item{MIGO: }{A dataset with `r prettyNum(nrow(manyios::memberships$MIGO), big.mark=",")` 
#' observations and `r ncol(manyios::memberships$MIGO)` variables: 
#' `r cli::pluralize("{names(manyios::memberships$MIGO)}")`.}
#' \item{IIGO: }{A dataset with `r prettyNum(nrow(manyios::memberships$IIGO), big.mark=",")` 
#' observations and `r ncol(manyios::memberships$IIGO)` variables: 
#' `r cli::pluralize("{names(manyios::memberships$IIGO)}")`.}
#' }
#' For more information and references to each of the datasets used,
#' please use the `manydata::call_sources()` and `manydata::compare_dimensions()` functions.
#' @source
#'   `r call_citations(memberships, output = "help")`
#' @section Mapping:
#' 
#' |  *manyios*  | *MIGO*  | *IIGO* | 
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

info_memberships <- tibble::tibble(Dataset = names(utils::data(memberships, package = "manyios")),
                                   Source = c("Roger, Charles B. and Sam S. Rowan. 2022. 'The New Terrain of Global Governance: Mapping Membership in Informal IOs'. _Journal of Conflict Resolution_ 67.6.",
                                              "Vabulas, Felicity, and Duncan Snidal. 2021. 'Cooperation under autonomy: Building and analyzing the Informal Intergovernmental Organizations 2.0 dataset'. _Journal of Peace Research_, 58.4, pp. 859-869."),
                                   URL = c("https://doi.org/10.7910/DVN/8CYXX5",
                                           "https://doi.org/10.1177/0022343320943920"))

