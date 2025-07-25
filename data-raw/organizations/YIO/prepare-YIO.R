# YIO Preparation Script

# The YIO dataset is scraped from the website of the
# Yearbook of International Organizations.

# This is a template for importing, cleaning, and exporting data
# ready for many packages universe.

# Stage one: Collecting data
# Data is gathered by scraping information from https://uia.org/ybio

# Extract first page of website because of different URL
url_1 <- "https://uia.org/ybio"
# URL of other pages
library(rvest)
last_page <- read_html(url_1) %>%
  html_elements("#content .last a") %>%
  as.character() %>%
  stringr::str_extract("page=.*[:digit:]") %>%
  stringr::str_remove("page=")
urls <- paste0("https://uia.org/ybio?page=", 1:last_page)

extr_title1 <- purrr::map(
  url_1,
  . %>%
    rvest::read_html() %>%
    rvest::html_nodes(".views-field-name-en") %>%
    rvest::html_text()
)
extr_title1 <- unlist(extr_title1)
extr_title1 <- extr_title1[-(1)]

# Extract the rest of the pages of website
extr_titles2 <- tryCatch(purrr::map(
  urls,
  . %>%
    rvest::read_html() %>%
    rvest::html_nodes(".views-field-name-en") %>%
    rvest::html_text()
))

#Remove the "Name" observation from top of the page
extr_titles2 <- lapply(extr_titles2, function(x) x[-1])
extr_titles2 <- unlist(extr_titles2)

Title <- c(extr_title1, extr_titles2)
YIO <- as.data.frame(Title)

# Clean the output
YIO$Title <- stringr::str_remove_all(YIO$Title, "\n")
YIO$Title <- stringr::str_remove_all(YIO$Title, "\\s\\s")
YIO$Title <- stringr::str_remove_all(YIO$Title, "\\s$")

# Extract abbreviations column
extr_abbrev1 <- purrr::map(
  url_1,
  . %>%
    rvest::read_html() %>%
    rvest::html_nodes(".views-field-abbr-en") %>%
    rvest::html_text()
)
extr_abbrev1 <- unlist(extr_abbrev1)
extr_abbrev1 <- extr_abbrev1[-(1)]

extr_abbrev2 <- tryCatch(purrr::map(
  urls,
  . %>%
    rvest::read_html() %>%
    rvest::html_nodes(".views-field-abbr-en") %>%
    rvest::html_text()
))

#Remove the "Name" observation from top of the page
extr_abbrev2 <- lapply(extr_abbrev2, function(x) x[-1])
extr_abbrev2 <- unlist(extr_abbrev2)

YIO$Abbreviation <- c(extr_abbrev1, extr_abbrev2)

#Clean the columns strings
YIO$Abbreviation <- stringr::str_remove_all(YIO$Abbreviation, "\n")
YIO$Abbreviation <- stringr::str_remove_all(YIO$Abbreviation, "\\s\\s")
YIO$Abbreviation <- stringr::str_remove_all(YIO$Abbreviation, "\\s$")
YIO$Abbreviation <- dplyr::na_if(YIO$Abbreviation, "")

# Extract year of creation
extr_beg1 <- purrr::map(
  url_1,
  . %>%
    rvest::read_html() %>%
    rvest::html_nodes(".views-field-birthyear") %>%
    rvest::html_text()
)
extr_beg1 <- unlist(extr_beg1)
extr_beg1 <- extr_beg1[-(1)]

extr_beg2 <- purrr::map(
  urls,
  . %>%
    rvest::read_html() %>%
    rvest::html_nodes(".views-field-birthyear") %>%
    rvest::html_text()
)
extr_beg2 <- lapply(extr_beg2, function(x) x[-1])
extr_beg2 <- unlist(extr_beg2)

YIO$Beg <- c(extr_beg1, extr_beg2)
YIO$Beg <- messydates::as_messydate(YIO$Beg)

#Clean the column strings
YIO$Beg <- stringr::str_remove_all(YIO$Beg, "\n")
YIO$Beg <- stringr::str_remove_all(YIO$Beg, "\\s\\s")
YIO$Beg <- stringr::str_remove_all(YIO$Beg, "\\s$")
YIO$Beg <- dplyr::na_if(YIO$Beg, "")

# Extract country column
extr_country1 <- purrr::map(
  url_1,
  . %>%
    rvest::read_html() %>%
    rvest::html_nodes(".views-field-addpays-1-en") %>%
    rvest::html_text()
)
extr_country1 <- unlist(extr_country1)
extr_country1 <- extr_country1[-(1)]

extr_country2 <- purrr::map(
  urls,
  . %>%
    rvest::read_html() %>%
    rvest::html_nodes(".views-field-addpays-1-en") %>%
    rvest::html_text()
)

extr_country2 <- lapply(extr_country2, function(x) x[-1])
extr_country2 <- unlist(extr_country2)

YIO$Country <- c(extr_country1, extr_country2)

#Clean the column strings
YIO$Country <- stringr::str_remove_all(YIO$Country, "\n")
YIO$Country <- stringr::str_remove_all(YIO$Country, "\\s\\s")
YIO$Country <- stringr::str_remove_all(YIO$Country, "\\s$")
YIO$Country <- dplyr::na_if(YIO$Country, "")

YIO <- as_tibble(YIO)

# Stage two: Correcting data
# In this stage you will want to correct the variable names and
# formats of the 'YIO' object until the object created below  (in stage three)
# passes all the tests.
# manypkgs includes several functions that should help cleaning
# and standardising your data.
# Please see the vignettes or website for more details.
YIO <- YIO %>%
  dplyr::mutate(across(everything(),
                       ~stringr::str_replace_all(., "^NA$", NA_character_))) %>%
  dplyr::mutate(Title = manypkgs::standardise_titles(Title),
                Beg = messydates::as_messydate(Beg)) %>%
  manydata::transmutate(State = Country, igoID = Abbreviation) %>%
  dplyr::distinct() %>%
  dplyr::relocate(igoID) %>%
  dplyr::arrange(Beg)

# Stage three: Connecting data
# Next run the following line to make YIO available
# within the package.
# This function also does two additional things.
# First, it creates a set of tests for this object to ensure adherence
# to certain standards.You can hit Cmd-Shift-T (Mac) or Ctrl-Shift-T (Windows)
# to run these tests locally at any point.
# Any test failures should be pretty self-explanatory and may require
# you to return to stage two and further clean, standardise, or wrangle
# your data into the expected format.
# Second, it also creates a documentation file for you to fill in.
# Please note that the export_data() function requires a .bib file to be
# present in the data_raw folder of the package for citation purposes.
# Therefore, please make sure that you have permission to use the dataset
# that you're including in the package.
# To add a template of .bib file to package,
# run `manypkgs::add_bib(organizations, YIO)`.
manypkgs::export_data(YIO, database = "organizations",
                      URL = "https://uia.org/ybio")
