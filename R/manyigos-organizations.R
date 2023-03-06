#' organizations database documentation
#'
#' @format The organizations database is a list that contains the
#' following 7 datasets: COW, VIGO, DIGO, IIGO, TRANSACCESS, YIO, MIA.
#' For more information and references to each of the datasets used,
#' please use the `data_source()` and `data_contrast()` functions.
#'\describe{
#' \item{COW: }{A dataset with 16139 observations and the following
#' 18 variables: igoID, Title, cowigoNR, Beg, End, Year, orgname, dead, integrated, replaced, igocode, version, accuracyofpre1965membershipdates, sourcesandnotes, imputed, political, social, economic.}
#' \item{VIGO: }{A dataset with 1662 observations and the following
#' 26 variables: igoID, Title, Beg, Year, vitality, zombie, life, dead, numb_mids_sum, mccall, pr_integration, aut3, s3un, Europe, LAmerica, MENA, Asia, NAmCarib, Africa, compdummy, age, competition, hardrel, itrans, desec5f, lngdpsum1.}
#' \item{DIGO: }{A dataset with 561 observations and the following
#' 29 variables: igoID, Title, Beg, End, Death, region, memb_form, members_censor, Mandate/Function, Living, Scope, function_c, scope_c, region_c, lifespan, event, event_1, life_1, WWI, WWII, WW, full_membership_start, asso_membership_start, observer_start, missing_data_start, full_membership_end, asso_membership_end, observer_end, missing_data_end.}
#' \item{IIGO: }{A dataset with 149 observations and the following
#' 12 variables: igoID, Title, Beg, End, End_reason, Regional, Nbr., Domain, Nbr State Mbrs 2017 (or end), Ind. Sec. Year, Formal Treaty Year, Follow-on IO.}
#' \item{TRANSACCESS: }{A dataset with 9007 observations and the following
#' 32 variables: igoID, Title, igobodyID, igoBody, Beg, Year, access, ID, ID_IO, ID_Body, openbody, multiple_arr, range_1, depth_1, permanence_1, codification_1, range_2, depth_2, permanence_2, codification_2, range_3, depth_3, permanence_3, codification_3, range_4, depth_4, permanence_4, codification_4, range_5, depth_5, permanence_5, codification_5.}
#' \item{YIO: }{A dataset with 75975 observations and the following
#' 4 variables: Title, Abbreviation, Beg, Country.}
#' \item{MIA: }{A dataset with 3961 observations and the following
#' 54 variables: igoID, Title, cowigoNR, Beg, Year, initial, end, typeI, contract, DIMENSIONS, delegation, pooling, DS_sum_st, COMPONENTS, delaccess, delsuspens, delconstit, delbudget, delcompliance, delpolicy, del_agenda, del_final, poolaccess, poolsuspens, poolconstit, poolbudget, poolcompliance, poolpolicy, poolagenda, poolfinal, coverage1, thirdparty1, tribunal1, binding1, nonstate1, remedy1, preliminary1, coverage2, thirdparty2, tribunal2, binding2, nonstate2, remedy2, preliminary2, DS_sum1, DS_sum2, DS_sum3, coverage3, thirdparty3, tribunal3, binding3, nonstate3, remedy3, preliminary3.}
#' }
#'
#' @details
#' ``` {r, echo = FALSE, warning = FALSE}
#' lapply(organizations, messydates::mreport)
#' ```
"organizations"
