% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manyios-memberships.R
\docType{data}
\name{memberships}
\alias{memberships}
\title{memberships datacube}
\format{
\describe{
\item{MIGO: }{A dataset with 80,624
observations and 9 variables:
igoID, stateID, StateName, membership, Year, Begin, End, cowID, and active.}
\item{IIGO: }{A dataset with 3,502
observations and 7 variables:
stateID, StateName, igoID, Title, Begin, End, and Year.}
}
For more information and references to each of the datasets used,
please use the \code{manydata::call_sources()} and \code{manydata::compare_dimensions()} functions.
}
\source{
\itemize{
\item Roger, Charles B. and Sam S. Rowan. 2022. 'The New Terrain of Global Governance: Mapping Membership in Informal IOs'. \emph{Journal of Conflict Resolution} 67.6.
\item Vabulas, Felicity, and Duncan Snidal. 2021. 'Cooperation under autonomy: Building and analyzing the Informal Intergovernmental Organizations 2.0 dataset'. \emph{Journal of Peace Research}, 58.4, pp. 859-869.
}
}
\usage{
memberships
}
\description{
The \code{manyios::memberships} datacube is a list containing 2 datasets: MIGO and IIGO.
It is a work-in-progress, so please let us know if you have any comments or suggestions.
}
\details{
\if{html}{\out{<div class="sourceCode">}}\preformatted{#> $MIGO
#> -------------------------------------------------------
#> |  Variable  |  Class  |  Obs  |  Missing  |  Miss \%  |
#> -------------------------------------------------------
#> |igoID       |character|  80624|          0|         0|
#> |stateID     |character|  80356|        268|      0.33|
#> |StateName   |character|  80624|          0|         0|
#> |membership  |character|  80624|          0|         0|
#> |Year        |mdate    |  80624|          0|         0|
#> |Begin       |mdate    |  80624|          0|         0|
#> |End         |mdate    |  80624|          0|         0|
#> |cowID       |character|  80624|          0|         0|
#> |active      |character|  80624|          0|         0|
#> -------------------------------------------------------
#> 
#> 
#> $IIGO
#> -------------------------------------------------------
#> |  Variable  |  Class  |  Obs  |  Missing  |  Miss \%  |
#> -------------------------------------------------------
#> |stateID     |character|   3491|         11|      0.31|
#> |StateName   |character|   3502|          0|         0|
#> |igoID       |character|   3493|          9|      0.26|
#> |Title       |character|   3502|          0|         0|
#> |Begin       |mdate    |   3269|        233|      6.65|
#> |End         |mdate    |   1065|       2437|     69.59|
#> |Year        |mdate    |   3502|          0|         0|
#> -------------------------------------------------------
}\if{html}{\out{</div>}}
}
\section{Mapping}{
\tabular{lll}{
   \emph{manyios} \tab \emph{MIGO} \tab \emph{IIGO} \cr
   igoID \tab  \tab Abbreviation \cr
   stateID \tab  \tab  \cr
   StateName \tab state_name \tab  \cr
   cowID \tab ccode \tab  \cr
   Title \tab IIGO Name \tab  \cr
}
}

\keyword{datasets}
