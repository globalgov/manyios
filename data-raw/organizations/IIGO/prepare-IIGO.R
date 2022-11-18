# IIGO Preparation Script

# <Please add more information about IIGO here 
# if it is an original dataset.>

# This is a template for importing, cleaning, and exporting data
# ready for many packages universe.

# Stage one: Collecting data
IIGO <- readxl::read_excel("data-raw/organizations/IIGO/Coop_Under_Autonomy_Appendix_Tables_Cond_Accept.xls")

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'IIGO' object until the object created
# below (in stage three) passes all the tests.
# We recommend that you avoid using one letter variable names to keep
# away from issues with ambiguous names down the road.
IIGO <- as_tibble(IIGO)
colnames(IIGO) <- IIGO[4,] # remove empty rows and set column names
IIGO <- IIGO[-(1:4),]
IIGO <-  IIGO %>%
  dplyr::mutate(`End IIGO Year` = ifelse(`End IIGO Year` == "UK", NA, `End IIGO Year`)) %>% # mark unknown (UK) as NA
  dplyr::mutate(across(everything(),
                       ~stringr::str_replace_all(., "^NA$", NA_character_))) %>% # Remove duplicates
  manydata::transmutate(Label = manypkgs::standardise_titles(Name),
                        Beg = messydates::as_messydate(`Beg. Year`),
                        End = messydates::as_messydate(`End IIGO Year`)) %>%
  dplyr::rename(igoID = `Abbrev.`,
                Regional = `Reg.`,
                End_reason = `Formal (1) or Dead (2)`,
                Domain = `Issue-area`,
                `Follow-on IO` = `Follow on org?`) %>%
  dplyr::relocate(igoID, Label, Beg, End, End_reason, Regional) %>%
  dplyr::distinct() %>%
  dplyr::arrange(Beg)

# manypkgs includes several functions that should help with
# cleaning and standardising your data
# such as `standardise_titles()` and `standardise_texts()`.
# Please see the vignettes or website for more details.

# Stage three: Connecting data
# Next run the following line to make IIGO available
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
# please run `manypkgs::add_bib("organizations", "IIGO")`.
manypkgs::export_data(IIGO, database = "organizations",
                      URL = "https://journals.sagepub.com/doi/full/10.1177/0022343320943920")
