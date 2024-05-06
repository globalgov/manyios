# DIGO Preparation Script

# The Death of International Organizations dataset by Eilstrup-Sangiovanni
# contains information on IGOs created since 1815 
# and the different ways some of these have ceased to exist.

# This is a template for importing, cleaning, and exporting data
# ready for many packages universe.

# Stage one: Collecting data
DIGO <- readr::read_csv("data-raw/organizations/DIGO/io_dataDID-1.0-RIO.csv")

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'DIGO' object until the object created
# below (in stage three) passes all the tests.
# We recommend that you avoid using one letter variable names to keep
# away from issues with ambiguous names down the road.
DIGO <- as_tibble(DIGO) %>%
  manydata::transmutate(igoID = ioname,
                        Title = manypkgs::standardise_titles(orgname)) %>%
  # make sure NAs are correctly coded
  dplyr::mutate(across(everything(),
                       ~stringr::str_replace_all(., "^NA$", NA_character_))) %>%
  manydata::transmutate(Beg = messydates::as_messydate(sdate),
                        End = messydates::as_messydate(ddate)) %>%
  dplyr::rename(Death = `Fate/death_reason`)
  dplyr::select(-c("...30", "...31", "...32")) %>%
  dplyr::relocate(igoID, Title, Beg, End, Death) %>%
  dplyr::distinct(.keep_all = TRUE) %>%
  dplyr::arrange(Beg)

# manypkgs includes several functions that should help with
# cleaning and standardising your data
# such as `standardise_titles()` and `standardise_texts()`.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make DIGO available
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
# please run `manypkgs::add_bib("organizations", "DIGO")`.
manypkgs::export_data(DIGO, database = "organizations",
                     URL = "https://link.springer.com/article/10.1007/s11558-018-9340-5")
