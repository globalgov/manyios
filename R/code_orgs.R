#' @export
code_orgs <- function(text, code = TRUE, max_count = 1){
  
  if(missing(text)) return(orgRegex)
  
  text <- stringi::stri_trans_general(text,"latin-ascii")
  
  purrr::map_chr(text, function(x) {
    out <- as.data.frame(orgRegex)[
      which(stringi::stri_detect_regex(x, 
                                       unlist(orgRegex[, 3]),
                                       max_count = max_count,
                                       opts_regex = list(case_insensitive = TRUE))),
      ifelse(code, 1, 2)]
    if(length(out)==0) NA_character_ else 
      if(max_count > 1 && length(out)>1) 
        paste0("{",paste(out, collapse = ","),"}") else out
  })
}

# Regex ####
orgRegex <- dplyr::tribble(
  ~orgID, ~Label, #~Regex,
  ## A ####
  "ALAAO","Joint Anti-Locust & Anti-Aviarian Org.",
  "ARICE","Africa Rice Center",
  "APFIC","Asia Pacific Fisheries Comm",
  "ARCAL","Promotion of Nuc. Sci & Tech in L/A",
  "ACPEU","ACP/EU Joint Assembly",                                              
"AFRST","Observatorie economique statistique sub-saharan Afr.",
"ACWL","Advisory Centre on WTO Law",                                       
"AMSC","African/Malgasy Sugar Council",                                   
"ACSO","African Civil Service Observatory",
"AFCI","Afr. Cultural Institute",
"AFDB","African Development Bank",
"AXIB","Afr. Exp/Import Bank",
"AFRND","Afr. Foundation for R & D",
"AFGEC","Afr. Fund Guarantee & Econ. Coop.",
"AFGNC","African Groundnut Council",
"AIPO","African Intellectual Property Organization",
"AMCO","African & Malagasy Coffee Org.",
"AMCOW","African Ministers' Council on Water",
"AOPDA","Afr. Oil Palm Dev. Assoc.",
"AOCRS","Afr. Org. of Cartography & Remote Sensing",
"APPA","African Petroleum Producers Assoc.",
"APTU","African Postal and Telecom Union",
"AFPU","African Postal Union",
"ARIPO","Afr. Regional Intellectual Property Org.",
"ACARE","Africare",
"ASATP","Afr. School of Architec. & Town Planning",
"ASCBC","African Standing Conf. on Biblio. Control",
"ATIMO","African Timber Org.",
"ACPG","ACP Group",
"ALSF","African Legal Support Facility",
"AARO","Afro-Asian Rural Development Org",
"AMIPO","Afro-Malagasy Industrial Property Office",
"AMPTU","Afro-Malagasy Postal and Telecomm Union",
"ACCT","Francophone Agency",
"AITIC","Agency for International Trade Information and Cooperation",
"ASANA","Agency for Safety of Aerial Nav. in Afr. & Madagas.",
"AMCC","Amazonian Coop. Council",
"ACDT","Am Cmte Dependent Territories",
"ANDEC","Andean Community",
"ANDEP","Andean Parliament",
"ANZUS","Australia-NewZealand-US Treaty Organization",
"AAAID","Arab Auth. for Ag. Invest. & Development",
"ABEDA","Arab Bank for Econ. Dev. in Africa",
"ACML","Arab Center for Medical Lit.",
"ABCC","Arab Cooperation Council",
"AFTE","Arab Federation for Technical Educ.",
"AFESD","Arab Fund for Social/Economic Development",
"AGPDO","Arab Gulf Prog. for UN Dev. Org.",
"AIDO","Arab Industrial Devel. & Mining Org.",
"ABIC","Arab Investment Company",
"ABLO","Arab Labor Org.",
"ABMU","Arab Maghreb Union",
"ABMF","Arab Monetary Fund",
"AOAD","Arab Org for Ag. & Develop.",
"AOMR","Arab Org. for Mineral Resources",
"ARPU","Arab Postal Union",
"ARTC","Arctic Council",
"ASEF","Asia-Europe Foundation",
"APCC","Asian/Pacific Coconut Comm.",
"ASPAC","Asia & Pacific Council",
"ASCU","Asian Clearing Union",
"ASDB","Asian Dev. Bank",
"AIDC","Asian Industrial Develop. Council",
"ASPO","Asian Productivity Organization",
"ASRC","Asian Reinsurance Corp.",
"AVRDC","Asian Vegetable Res. & Dev. Center",
"AALCO","Asian-African Legal Consultative Org",
"AOPU","Asian-Oceanic Postal Union",
"APEC","Asia-Pacific Economic Cooperation",
"APIBD","Asia-Pac Instit. for Broadcast Develop.",
"APTC","Asian-Pacific Telecommunity",
"AACB","Assoc. of African Central Banks",
"AATA","Assoc. of African Tax Administrators",
"AATPO","Assoc. of Afr. Trade Promotion Orgs.",
"ACBS","Association of Caribbean States",
"AFSPC","Association of Financial Supervisors of Pacific Countries",
"AIOEC","Assoc. Iron Ore Expt. Countries",
"ARUBB","Association of Rubber Producing States",
"ASEAN","Association of Southeast Asian Nations",
"ATPC","Assoc. Tin Producing Countries",
"AFUN","African Union",
## B ####
"BALC","Baltic Council",
"BALBT","Baltic Batallion",
"BISET","Bank for International Settlements",
"BSEC","Black Sea Economic Council",
"BONN","Bonn Agreement",
"BOTS","Bank of the South",
"BIIEF","Banque Inter'l d'Info. sur les Estats Francophone",
"BOBP","Bay of Bengal Programme Inter-Governmental Organization",
"BENLX","Benelux Community",
"BENIP","Benelux Organization for Intellectual Property",
"BIONT","BIONET",
"BNDP","Board of Nordic Dev. Projects",
"BCSC","British Commonwealth Scientific Comm",
## D ####
"DANUB","Danube Commission",
"DLCEA","Desert Locust Control Org-East Af",
"DEV8","Developing 8 Organization for Economic Cooperation",
"DBGLS","Dev. Bank of Great Lake States",
## F ####
"FEAST","Far East Comm",
"FIPLC","Fund 4 Devel. of Indigen Peoples of LA/Carib",
## H ####
"HCPIL","Hague Conf on Private Intl Law",
## J ####
"JINR","Joint Instit for Nuke Research",
## K ####
## Q ####
## T ####
"TCRMG","Tripartite Agreement for Monetary Gold",
"TURKC","Joint Admin. of Turkish Culture & Arts",
## V ####
"VALDI","Group of S. Hemisp. Countries on Env.",
"VASAB","Vision & Strategies Around Baltic Sea",
## Y ####
  ## Z ####
  ## Other ####
)

