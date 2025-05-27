# manyigos 0.0.2

2025-05-27

## Package

* Added new package logo

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
