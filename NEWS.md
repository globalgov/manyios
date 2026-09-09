# manyios 0.1.0

## Package

- Updated the package logo in the README to the new Palais des Nations design
- Updated templates, workflows, and CONTRIBUTING

## Data

- Preparation scripts now call `manystates::code_states()` and `manytreaties::standardise_titles()`
- Closed #18 by reading `informals_v3.dta` as UTF-8, 
  which repairs the mis-decoded Sao Tome and Cote d'Ivoire state names in `memberships$MIGO`
- Closed #18 by recoding `memberships$MIGO` with `manystates::code_states()`, 
  which resolves the two missing `stateID` values and updates Algeria from `ALG` to `DZA`
- Recoded `memberships$IIGO` with `manystates::code_states()`, 
  which resolves the missing `stateID` for the Democratic Republic of the Congo, 
  corrects the double match `GIN - GNQ` for Equatorial Guinea to `GNQ`, 
  updates Algeria from `ALG` to `DZA`, 
  and codes Yugoslavia as its successor `SRB`

# manyios 0.0.2

2025-06-02

## Package

* Closed #7 adding website and new package logo
* Closed #11 by updating documentation to make it easier to retrieve information on data sources
* Closed #13 by changing package name to manyios and updating references to manyigos across files

## Data

* Added `memberships$MIGO` dataset

# manyigos 0.0.1

2023-03-07

## Package

* Set up manyigos package using manydata::setup_package()
  * Added `DESCRIPTION` file
  * Added `R` folder
  * Added `LICENSE` file
  * Added `NAMESPACE` file
  * Added `NEWS` file
  * Added `README` file
  * Added `.github` folder
  * Added `CODE_OF_CONDUCT` file
  * Added `CONTRIBUTING` file
  * Added `pull_request_template` file
  * Added `ISSUE_TEMPLATE` folder
  * Added `bug_report` file
  * Added `feature_request` file
  * Added `workflows` folder
  * Added `prchecks` file
  * Added `pushrelease` file
  * Added `prcommands` file
  * Added `tests` folder
  * Added `testthat` folder
  * Added `testthat` file
* Added package website and logo

## Data

* Added seven datasets on international organizations, cleaned and exported into `organizations` database.
* Closed #1 by adding `COW` dataset to organizations database
* Closed #3 by adding `IIGO` dataset to organizations database
* Closed #2 by adding `DIGO` dataset to organizations database
* Closed #4 by adding `TRANSACCESS` dataset to organizations database
* Closed #5 by adding `VIGO` dataset to organizations database
* Moved `YIO` dataset to organizations database from `{manyenviron}`
* Moved `MIA` dataset to organizations database from `{manyenviron}`
* Added `memberships` database with membership data from COW and IIGO datasets.
  * Added `COW_MEM` dataset
  * Added `IIGO_MEM` dataset
* Cleaned datasets by standardizing titles and dates in databases using `manypkgs::standardise_titles()` and  `messydates::as_messydate()` functions
* Added tests for datasets with `manypkgs::export_data()` in `organizations` and `memberships` database
