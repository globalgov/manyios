# MIGO Preparation Script

# This is a template for importing, cleaning, and exporting data
# ready for the many package.

# Stage one: Collecting data
MIGO <- haven::read_dta("data-raw/memberships/MIGO/informals_v3.dta")

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'MIGO' object until the object created
# below (in stage three) passes all the tests.
# We recommend that you avoid using one letter variable names to keep
# away from issues with ambiguous names down the road.
MIGO <- as_tibble(MIGO) %>%
  tidyr::pivot_longer(c("acd":"zc"), names_to = "igoID",
                      values_to = "membership") %>%
  dplyr::filter(membership == 1|membership == 2|membership == 3) %>%
  manydata::transmutate(Year = messydates::as_messydate(year),
                        StateName = manypkgs::standardise_titles(state_name)) %>%
  dplyr::mutate(stateID = manypkgs::code_states(StateName, activity = F,
                                                replace = "ID")) %>%
  dplyr::group_by(StateName) %>%
  dplyr::mutate(Begin = dplyr::first(Year),
                End = dplyr::last(Year)) %>%
  dplyr::relocate(igoID, stateID, StateName, membership, Year, Begin, End) %>%
  dplyr::arrange(igoID, stateID, Year)

# Standardize ID
MIGO <- MIGO %>%
  dplyr::mutate(igoID = toupper(igoID)) %>%
  dplyr::rename(cowID = ccode)

# Remove duplicates and ensure NAs are coded correctly
MIGO <- MIGO %>%
  dplyr::mutate(across(everything(),
                       ~stringr::str_replace_all(.,
                                                 "^NA$", NA_character_))) %>%
  dplyr::mutate(Begin = messydates::as_messydate(Begin),
                End = messydates::as_messydate(End),
                Year = messydates::as_messydate(Year)) %>%
  dplyr::distinct(.keep_all = TRUE)

# manypkgs includes several functions that should help with
# cleaning and standardising your data
# such as `standardise_titles()` and `standardise_texts()`.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make MIGO available
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
# please run `manypkgs::add_bib("memberships", "MIGO")`.
manypkgs::export_data(MIGO, datacube = "memberships",
                      URL = "https://doi.org/10.7910/DVN/8CYXX5")
