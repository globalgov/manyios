#' organizations database documentation
#'
#' @format The organizations database is a list that contains the
#' following 3 datasets: COW, VIGO, DIGO.
#' For more information and references to each of the datasets used,
#' please use the `data_source()` and `data_contrast()` functions.
#' @imports manydata
#'\describe{
#' \item{COW: }{A dataset with 16139 observations and the following
#' 235 variables: igoID, Label, Beg, End, Year, afghanistan, albania, algeria, andorra, angola, antiguabarbuda, argentina, armenia, australia, austria, austriahungary, azerbaijan, baden, bahamas, bahrain, bangladesh, barbados, bavariaelect, belarus, belgium, belize, benin, bhutan, bolivia, bosnia, botswana, brazil, brunei, bulgaria, burkinafaso, burundi, car, cambodia, cameroon, canada, capeverde, chad, chile, china, colombia, comoros, congobrazz, costarica, croatia, cuba, cyprus, czechrep, czechoslovakia, denmark, djibouti, domrepublic, dominica, egermany, etimor, ecuador, egypt, elsalvador, eqguinea, eritrea, estonia, ethiopia, fyromacedonia, fiji, finland, france, gabon, gambia, georgia, germany, ghana, greece, grenada, guatemala, guinea, guineabissau, guyana, haiti, hanover, hesseelect, hessegrand, honduras, hungary, iceland, india, indonesia, iran, iraq, ireland, israel, italy, ivorycoast, jamaica, japan, jordan, kazakhstan, kenya, kiribati, korea, kosovo, kuwait, kyrgyzstan, laos, latvia, lebanon, lesotho, liberia, libya, liechtenstein, lithuania, luxembourg, madagascar, malawi, malaysia, maldives, mali, malta, marshallis, mauritania, mauritius, mecklenburg, mexico, micronesiafs, modena, moldova, monaco, mongolia, morocco, montenegro, mozambique, myanmar, namibia, nauru, nepal, netherlands, newzealand, nicaragua, niger, nigeria, nokorea, norway, nyemen, oman, pakistan, palau, panama, papalstates, papuanewguinea, paraguay, parma, peru, philippines, poland, portugal, qatar, romania, russia, rwanda, svietnam, syemen, sanmarino, saotome, saudiarabia, saxony, senegal, seychelles, sierraleone, singapore, slovakia, slovenia, soafrica, sokorea, sosudan, solomonis, somalia, spain, srilanka, stkitts, stlucia, stvincent, sudan, suriname, swaziland, sweden, switzerland, syria, taiwan, tajikistan, tanzania, thailand, togo, tonga, trinidad, tunisia, turkey, turkmenistan, tuscany, tuvalu, twosicilies, uae, uk, usa, uganda, ukraine, uruguay, uzbekistan, vanuatu, venezuela, vietnam, wgermany, wsamoa, wurtenburg, yemen, yugoslaviaserb, zaire, zambia, zanzibar, zimbabwe, orgname, dead, integrated, replaced, ionum, igocode, version, accuracyofpre1965membershipdates, sourcesandnotes, imputed, political, social, economic.}
#' \item{VIGO: }{A dataset with 1662 observations and the following
#' 26 variables: igoID, Label, Beg, Year, vitality, zombie, life, dead, numb_mids_sum, mccall, pr_integration, aut3, s3un, Europe, LAmerica, MENA, Asia, NAmCarib, Africa, compdummy, age, competition, hardrel, itrans, desec5f, lngdpsum1.}
#' \item{DIGO: }{A dataset with 561 observations and the following
#' 29 variables: igoID, Label, Beg, End, Fate/death_reason, region, memb_form, members_censor, Mandate/Function, Living, Scope, function_c, scope_c, region_c, lifespan, event, event_1, life_1, WWI, WWII, WW, full_membership_start, asso_membership_start, observer_start, missing_data_start, full_membership_end, asso_membership_end, observer_end, missing_data_end.}
#' }
#'
#' @details
#' ``` {r, echo = FALSE, warning = FALSE}
#' lapply(organizations, messydates::mreport)
#' ```
"organizations"
