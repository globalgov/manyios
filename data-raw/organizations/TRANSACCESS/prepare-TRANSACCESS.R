# TRANSACCESS Preparation Script

# The Transaccess dataset by Sommerer, Tallberg, and Squatrito
# contains information on the access of transnational actors to IGO bodies.

# This is a template for importing, cleaning, and exporting data
# ready for many packages universe.

# Stage one: Collecting data
TRANSACCESS <- haven::read_dta("data-raw/organizations/TRANSACCESS/Transaccess data.dta")

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'TRANSACCESS' object until the object created
# below (in stage three) passes all the tests.
# We recommend that you avoid using one letter variable names to keep
# away from issues with ambiguous names down the road.
TRANSACCESS <- as_tibble(TRANSACCESS) %>%
  manydata::transmutate(igoID = IO,
                        Title = manypkgs::standardise_titles(IOname),
                        igobodyID = IDIOBO,
                        igoBody = manypkgs::standardise_titles(IObodyname)) %>%
  dplyr::group_by(igoID) %>%
  dplyr::mutate(Beg = min(Year)) %>%
  dplyr::mutate(across(everything(), # ensure NAs are coded correctly
                       ~stringr::str_replace_all(., "^NA$", NA_character_))) %>%
  dplyr::mutate(Beg = messydates::as_messydate(Beg),
                Year = messydates::as_messydate(Year)) %>% 
  dplyr::distinct() %>% # Remove duplicates
  dplyr::relocate(igoID, Title, igobodyID, igoBody, Beg, Year, access) %>%
  dplyr::arrange(Beg)

# manypkgs includes several functions that should help with
# cleaning and standardising your data
# such as `standardise_titles()` and `standardise_texts()`.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make TRANSACCESS available
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
# please run `manypkgs::add_bib("organizations", "TRANSACCESS")`.
manypkgs::export_data(TRANSACCESS, database = "organizations",
                      URL = "https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DDE1HE")
