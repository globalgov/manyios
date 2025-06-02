# IIGO_MEM Preparation Script

# This is a template for importing, cleaning, and exporting data
# ready for many packages universe.

# Stage one: Collecting data
IIGO_MEM <- readxl::read_excel("data-raw/organizations/IIGO/Coop_Under_Autonomy_Appendix_Tables_Cond_Accept.xls",
                               sheet = "IIGOs by state 2017 ",
                               range = "A5:HL154")

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'IIGO_MEM' object until the object created
# below (in stage three) passes all the tests.
# We recommend that you avoid using one letter variable names to keep
# away from issues with ambiguous names down the road.
IIGO_MEM <- as_tibble(IIGO_MEM) %>%
  manydata::transmutate(Title = manypkgs::standardise_titles(`IIGO Name`)) %>%
  dplyr::rename(igoID = Abbreviation) %>%
  dplyr::mutate(Year = messydates::as_messydate(as.character(2017))) %>%
  tidyr::pivot_longer("Afghanistan":"Zimbabwe",
                      names_to = "StateName", values_to = "member") %>%
  dplyr::filter(member == 1) %>%
  dplyr::mutate(stateID = manypkgs::code_states(StateName, activity = FALSE,
                                                replace = "ID"))

IIGO <- manyios::organizations$IIGO %>%
  dplyr::select(igoID, Title, Beg, End)

IIGO_MEM <- dplyr::left_join(IIGO_MEM, IIGO, by = c("igoID", "Title"))

# Remove duplicates and ensure NAs are coded correctly
IIGO_MEM <- IIGO_MEM %>%
  dplyr::mutate(across(everything(),
                       ~stringr::str_replace_all(., "^NA$", NA_character_))) %>% 
  dplyr::mutate(Beg = messydates::as_messydate(Beg), #Beg date of IIGO
                End = messydates::as_messydate(End), #End date of IIGO
                Year = messydates::as_messydate(Year)) %>% 
  dplyr::distinct(.keep_all = TRUE) %>%
  dplyr::select(stateID, StateName, igoID, Title, Beg, End, Year) %>%
  dplyr::arrange(Beg)

# manypkgs includes several functions that should help with
# cleaning and standardising your data
# such as `standardise_titles()` and `standardise_texts()`.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make IIGO_MEM available
# within the package.
# This function also does two additional things.
# First, it creates a set of tests for this object to ensure adherence
# to certain standards.
# You can hit Cmd-Shift-T (Mac) or Ctrl-Shift-T (Windows)
# to run these tests locally at any point.
# Any test failures should be pretty self-explanatory
# and may require you to return to stage two and further clean,
# standardise, or wrangle your data into the expected format.
# Second, it also creates a documentation file for you to fill in.
# Please note that the export_data() function requires a .bib file to be
# present in the data_raw folder of the package for citation purposes.
# Therefore, please make sure that you have permission to use the dataset
# that you're including in the package.
# To add a template of .bib file to the package,
# please run `manypkgs::add_bib("memberships", "IIGO_MEM")`.
manypkgs::export_data(IIGO_MEM, database = "memberships",
                      URL = "https://journals.sagepub.com/doi/full/10.1177/0022343320943920")
