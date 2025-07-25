% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manyios-organizations.R
\docType{data}
\name{organizations}
\alias{organizations}
\title{organizations datacube}
\format{
\describe{
\item{DIGO: }{A dataset with 561
observations and 29 variables:
igoID, Title, Begin, End, Death, region, memb_form, members_censor, Mandate/Function, Living, Scope, function_c, scope_c, region_c, lifespan, event, event_1, life_1, ..., observer_end, and missing_data_end.}
\item{IIGO: }{A dataset with 149
observations and 12 variables:
igoID, Title, Begin, End, End_reason, Regional, Nbr., Domain, Nbr State Mbrs 2017 (or end), Ind. Sec. Year, Formal Treaty Year, and Follow-on IGO.}
\item{TRANSACCESS: }{A dataset with 9,007
observations and 32 variables:
igoID, Title, igobodyID, igoBody, Begin, Year, access, ID, ID_IO, ID_Body, openbody, multiple_arr, range_1, depth_1, permanence_1, codification_1, range_2, depth_2, ..., permanence_5, and codification_5.}
}
For more information and references to each of the datasets used,
please use the \code{manydata::call_sources()} and \code{manydata::compare_dimensions()} functions.
}
\source{
\itemize{
\item Eilstrup-Sangiovanni, Mette. 2020. 'Death of international organizations. The organizational ecology of intergovernmental organizations, 1815-2015'. \emph{The Review of International Organizations} 15, pp. 339-370.
\item Vabulas, Felicity, and Duncan Snidal. 2021. 'Cooperation under autonomy: Building and analyzing the Informal Intergovernmental Organizations 2.0 dataset'. \emph{Journal of Peace Research} 58.4, pp. 859-869.
\item Sommerer, Thomas, Jonas Tallberg, and Theresa Squatrito. 2015. 'Transnational Access to International Organizations 1950-2010'. \emph{Harvard Dataverse}.
}
}
\usage{
organizations
}
\description{
The \code{manyios::organizations} datacube is a list containing 3 datasets: DIGO, IIGO, and TRANSACCESS.
It is a work-in-progress, so please let us know if you have any comments or suggestions.
}
\details{
\if{html}{\out{<div class="sourceCode">}}\preformatted{#> $DIGO
#> ----------------------------------------------------------------
#> |      Variable       |  Class  |  Obs  |  Missing  |  Miss \%  |
#> ----------------------------------------------------------------
#> |igoID                |character|    561|          0|         0|
#> |Title                |character|    561|          0|         0|
#> |Begin                |mdate    |    561|          0|         0|
#> |End                  |mdate    |    561|          0|         0|
#> |Death                |character|    212|        349|     62.21|
#> |region               |character|    560|          1|      0.18|
#> |memb_form            |character|    560|          1|      0.18|
#> |members_censor       |character|    549|         12|      2.14|
#> |Mandate/Function     |character|    559|          2|      0.36|
#> |Living               |character|    560|          1|      0.18|
#> |Scope                |character|    559|          2|      0.36|
#> |function_c           |character|    559|          2|      0.36|
#> |scope_c              |character|    559|          2|      0.36|
#> |region_c             |character|    560|          1|      0.18|
#> |lifespan             |character|    560|          1|      0.18|
#> |event                |character|    558|          3|      0.53|
#> |event_1              |character|    557|          4|      0.71|
#> |life_1               |character|    558|          3|      0.53|
#> |WWI                  |character|    559|          2|      0.36|
#> |WWII                 |character|    560|          1|      0.18|
#> |WW                   |character|    560|          1|      0.18|
#> |full_membership_start|character|    543|         18|      3.21|
#> |asso_membership_start|character|    544|         17|      3.03|
#> |observer_start       |character|    544|         17|      3.03|
#> |missing_data_start   |character|    544|         17|      3.03|
#> |full_membership_end  |character|    560|          1|      0.18|
#> |asso_membership_end  |character|    560|          1|      0.18|
#> |observer_end         |character|    560|          1|      0.18|
#> |missing_data_end     |character|    560|          1|      0.18|
#> ----------------------------------------------------------------
#> 
#> 
#> $IIGO
#> -----------------------------------------------------------------------
#> |          Variable          |  Class  |  Obs  |  Missing  |  Miss \%  |
#> -----------------------------------------------------------------------
#> |igoID                       |character|    147|          2|      1.34|
#> |Title                       |character|    149|          0|         0|
#> |Begin                       |mdate    |    149|          0|         0|
#> |End                         |mdate    |     51|         98|     65.77|
#> |End_reason                  |character|    149|          0|         0|
#> |Regional                    |character|    149|          0|         0|
#> |Nbr.                        |character|    149|          0|         0|
#> |Domain                      |character|    146|          3|      2.01|
#> |Nbr State Mbrs 2017 (or end)|character|    149|          0|         0|
#> |Ind. Sec. Year              |character|     32|        117|     78.52|
#> |Formal Treaty Year          |character|     15|        134|     89.93|
#> |Follow-on IGO               |character|    148|          1|      0.67|
#> -----------------------------------------------------------------------
#> 
#> 
#> $TRANSACCESS
#> ---------------------------------------------------------
#> |   Variable   |  Class  |  Obs  |  Missing  |  Miss \%  |
#> ---------------------------------------------------------
#> |igoID         |character|   9007|          0|         0|
#> |Title         |character|   9007|          0|         0|
#> |igobodyID     |character|   9007|          0|         0|
#> |igoBody       |character|   9007|          0|         0|
#> |Begin         |mdate    |   9007|          0|         0|
#> |Year          |mdate    |   9007|          0|         0|
#> |access        |character|   9007|          0|         0|
#> |ID            |character|   9007|          0|         0|
#> |ID_IO         |character|   9007|          0|         0|
#> |ID_Body       |character|   9007|          0|         0|
#> |openbody      |character|   9007|          0|         0|
#> |multiple_arr  |character|   9007|          0|         0|
#> |range_1       |character|   9007|          0|         0|
#> |depth_1       |character|   9007|          0|         0|
#> |permanence_1  |character|   9007|          0|         0|
#> |codification_1|character|   9007|          0|         0|
#> |range_2       |character|   9007|          0|         0|
#> |depth_2       |character|   9007|          0|         0|
#> |permanence_2  |character|   9007|          0|         0|
#> |codification_2|character|   9007|          0|         0|
#> |range_3       |character|   9007|          0|         0|
#> |depth_3       |character|   9007|          0|         0|
#> |permanence_3  |character|   9007|          0|         0|
#> |codification_3|character|   9007|          0|         0|
#> |range_4       |character|   9007|          0|         0|
#> |depth_4       |character|   9007|          0|         0|
#> |permanence_4  |character|   9007|          0|         0|
#> |codification_4|character|   9007|          0|         0|
#> |range_5       |character|   9007|          0|         0|
#> |depth_5       |character|   9007|          0|         0|
#> |permanence_5  |character|   9007|          0|         0|
#> |codification_5|character|   9007|          0|         0|
#> ---------------------------------------------------------
}\if{html}{\out{</div>}}
}
\section{Mapping}{


|  \emph{manyios}  | \emph{DIGO}  | \emph{IIGO} | \emph{TRANSACCESS} |
|:---------------|:------|:------|
| igoID  | ioname | Abbrev.| IO |
| Begin | sdate | Beg. Year | |
| End | ddate | End IIGO Year |
| Title | orgname | Name | IOname |
| Regional | | Reg. | |
| Death | Fate/death_reason | | |
| End_reason | | Formal (1) or Dead (2) | |
| Domain | | Issue-area | |
| Follow-on IGO | | Follow on org? | |
| igobodyID | | | IDIOBO |
| igoBody | | | IObodyname |
}

\keyword{datasets}
