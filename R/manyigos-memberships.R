#' memberships database documentation
#'
#' @format The memberships database is a list that contains the
#' following 2 datasets: COW_MEM, IIGO_MEM.
#' For more information and references to each of the datasets used,
#' please use the `data_source()` and `data_contrast()` functions.
#'\describe{
#' \item{COW_MEM: }{A dataset with 14317 observations and the following
#' 7 variables: stateID, StateName, igoID, Title, cowigoNR, Beg, End.}
#' \item{IIGO_MEM: }{A dataset with 3502 observations and the following
#' 7 variables: stateID, StateName, igoID, Title, Beg, End, Year.}
#' }
#'
#' @details
#' ``` {r, echo = FALSE, warning = FALSE}
#' lapply(memberships, messydates::mreport)
#' ```
"memberships"
