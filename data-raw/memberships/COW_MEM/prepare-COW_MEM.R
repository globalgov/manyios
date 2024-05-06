# COW_MEM Preparation Script

# This is a template for importing, cleaning, and exporting data
# ready for many packages universe.

# Stage one: Collecting data
COW_MEM <- readr::read_delim("data-raw/organizations/COW/igo_year_formatv3.csv", 
                             delim = "\t", escape_double = FALSE,
                             trim_ws = TRUE)

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'COW_MEM' object until the object created
# below (in stage three) passes all the tests.
# We recommend that you avoid using one letter variable names to keep
# away from issues with ambiguous names down the road.
COW_MEM <- as_tibble(COW_MEM) %>%
  manydata::transmutate(igoID = ioname,
                        Year = messydates::as_messydate(as.character(year)),
                        Title = manypkgs::standardise_titles(longorgname)) %>%
  dplyr::rename(cowigoNR = ionum) %>%
  tidyr::pivot_longer("afghanistan":"zimbabwe",
                      names_to = "StateName", values_to = "member") %>%
  dplyr::filter(member == 1) %>%
  dplyr::mutate(stateID = manypkgs::code_states(StateName, activity = FALSE,
                                                replace = "ID"))
# Get Beginning and End of states' membership
Beg <- COW_MEM %>%
  dplyr::group_by(igoID, StateName) %>%
  dplyr::slice_min(Year, n = 1) %>%
  dplyr::mutate(Beg = Year) %>%
  dplyr::select(igoID, StateName, Beg)
End <- COW_MEM %>%
  dplyr::group_by(igoID, StateName) %>%
  dplyr::slice_max(Year, n = 1) %>%
  dplyr::mutate(End = Year) %>%
  dplyr::select(igoID, StateName, End)
COW_MEM <- dplyr::left_join(COW_MEM, Beg, by = c("igoID", "StateName")) %>%
  dplyr::left_join(End, by = c("igoID", "StateName")) %>%
  dplyr::select(stateID, StateName, igoID, Title, cowigoNR, Beg, End) %>%
  dplyr::distinct(.keep_all = TRUE) %>%
  dplyr::arrange(Beg)

# Remove duplicates and ensure NAs are coded correctly
COW_MEM <- COW_MEM %>%
  dplyr::mutate(across(everything(),
                       ~stringr::str_replace_all(., "^NA$", NA_character_))) %>% 
  dplyr::mutate(Beg = messydates::as_messydate(Beg),
                End = messydates::as_messydate(End)) %>% 
  dplyr::distinct(.keep_all = TRUE)

# manypkgs includes several functions that should help with
# cleaning and standardising your data
# such as `standardise_titles()` and `standardise_texts()`.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make COW_MEM available
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
# please run `manypkgs::add_bib("memberships", "COW_MEM")`.
manypkgs::export_data(COW_MEM, database = "memberships",
                      URL = "https://correlatesofwar.org/data-sets/igos/")
