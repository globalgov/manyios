# MIA Preparation Script

# This is a template for importing, cleaning, and exporting data
# ready for the many packages universe.

# Stage one: Collecting data
MIA <- haven::read_dta("data-raw/organizations/MIA/DP_May 2021.dta")

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'MIA' object until the object created
# below (in stage three) passes all the tests.
MIA <- as_tibble(MIA) %>%
  dplyr::rename(igoID = acronym,
                cowigoNR = ionumber) %>%
  dplyr::mutate(across(everything(), # ensure NAs coded correctly
                       ~stringr::str_replace_all(., "^NA$", NA_character_))) %>%
  manydata::transmutate(Title = manypkgs::standardise_titles(ioname),
                        Beg = messydates::as_messydate(as.character(inception)),
                        Year = messydates::as_messydate(as.character(year))) %>%
  # initial and end variables refer to the first and last years that the IGO is recorded in the dataset respectively,
  # rather than the Beginning or End dates of the IGO
  dplyr::relocate(igoID, Title, cowigoNR, Beg, Year) %>%
  dplyr::arrange(Beg)

# manypkgs includes several functions that should help cleaning
# and standardising your data.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make MIA available
# within the package.
manypkgs::export_data(MIA,
                      database = "organizations",
                      URL = "https://garymarks.web.unc.edu/data/international-authority/")
# This function also does two additional things.
# First, it creates a set of tests for this object to ensure
# adherence to certain standards. You can hit Cmd-Shift-T (Mac)
# or Ctrl-Shift-T (Windows) to run these tests locally at any point.
# Any test failures should be pretty self-explanatory and may require
# you to return to stage two and further clean, standardise, or wrangle
# your data into the expected format.
# Second, it also creates a documentation file for you to fill in.
# Please make sure that you cite any sources appropriately and fill
# in as much detail about the variables etc as possible.
