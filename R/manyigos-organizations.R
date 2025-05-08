#' organizations datacube
#' @description `r describe_datacube(manyigos::organizations)`.
#'   It is a work-in-progress, so please let us know if you have any comments or suggestions.
#' @format
#' \describe{
#' \item{DIGO: }{A dataset with `r prettyNum(nrow(manyigos::organizations$DIGO), big.mark=",")` 
#' observations and `r ncol(manyigos::organizations$DIGO)` variables: 
#' `r cli::pluralize("{names(manyigos::organizations$DIGO)}")`.}
#' \item{IIGO: }{A dataset with `r prettyNum(nrow(manyigos::organizations$IIGO), big.mark=",")` 
#' observations and `r ncol(manyigos::organizations$IIGO)` variables: 
#' `r cli::pluralize("{names(manyigos::organizations$IIGO)}")`.}
#' \item{TRANSACCESS: }{A dataset with `r prettyNum(nrow(manyigos::organizations$TRANSACCESS), big.mark=",")` 
#' observations and `r ncol(manyigos::organizations$TRANSACCESS)` variables: 
#' `r cli::pluralize("{names(manyigos::organizations$TRANSACCESS)}")`.}
#' }
#' For more information and references to each of the datasets used,
#' please use the `manydata::call_sources()` and `manydata::compare_dimensions()` functions.
#' @source
#'   `r call_citations(organizations, output = "help")`
#' @section Mapping:
#' 
#' |  *manyigos*  | *DIGO*  | *IIGO* | *TRANSACCESS* |
#' |:---------------|:------|:------|
#' | igoID  | ioname | Abbrev.| IO |
#' | Begin | sdate | Beg. Year | |
#' | End | ddate | End IIGO Year |
#' | Title | orgname | Name | IOname |
#' | Regional | | Reg. | |
#' | Death | Fate/death_reason | | |
#' | End_reason | | Formal (1) or Dead (2) | |
#' | Domain | | Issue-area | |
#' | Follow-on IGO | | Follow on org? | |
#' | igobodyID | | | IDIOBO |
#' | igoBody | | | IObodyname |
#' 
#' @md
#' @details
#' ``` {r, echo = FALSE, warning = FALSE}
#' lapply(organizations, manydata::mreport)
#' ```
"organizations"
