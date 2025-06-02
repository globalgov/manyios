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
#' @md
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
#' @details
#' ``` {r, echo = FALSE, warning = FALSE}
#' lapply(organizations, manydata::mreport)
#' ```
"organizations"

info_organizations <- tibble::tibble(Dataset = names(utils::data(organizations, package = "manyigos")),
                                     Source = c("Eilstrup-Sangiovanni, Mette. 2020. 'Death of international organizations. The organizational ecology of intergovernmental organizations, 1815–2015'. _The Review of International Organizations_ 15, pp. 339-370.",
                                             "Vabulas, Felicity, and Duncan Snidal. 2021. 'Cooperation under autonomy: Building and analyzing the Informal Intergovernmental Organizations 2.0 dataset'. _Journal of Peace Research_ 58.4, pp. 859-869.",
                                             "Sommerer, Thomas, Jonas Tallberg, and Theresa Squatrito. 2015. 'Transnational Access to International Organizations 1950-2010'. _Harvard Dataverse_."),
                                     URL = c("https://doi.org/10.1007/s11558-018-9340-5",
                                          "https://doi.org/10.1177/0022343320943920",
                                          "https://10.7910/DVN/DDE1HE"))

