# Test if the dataset meets the many packages universe requirements

# Report missing values
test_that("missing observations are reported correctly", {
  expect_false(any(grepl("^n/a$", memberships[["IIGO"]])))
  expect_false(any(grepl("^N/A$", memberships[["IIGO"]])))
  expect_false(any(grepl("^\\s$", memberships[["IIGO"]])))
  expect_false(any(grepl("^\\.$", memberships[["IIGO"]])))
  expect_false(any(grepl("N\\.A\\.$", memberships[["IIGO"]])))
  expect_false(any(grepl("n\\.a\\.$", memberships[["IIGO"]])))
})

# Uniformity tests (agreements have a stateID and Begin columns)
test_that("datasets have the required variables", {
  pointblank::expect_col_exists(memberships[["IIGO"]],
                                pointblank::vars(stateID))
  pointblank::expect_col_exists(memberships[["IIGO"]],
                                pointblank::vars(Begin))
})

# Date columns should be in mdate class
test_that("Columns are not in date, POSIXct or POSIXlt class", {
  expect_false(any(lubridate::is.Date(memberships[["IIGO"]])))
  expect_false(any(lubridate::is.POSIXct(memberships[["IIGO"]])))
  expect_false(any(lubridate::is.POSIXlt(memberships[["IIGO"]])))
})

# Dates are standardized for mandatory column
test_that("Column `Begin` has standardised dates", {
  expect_equal(class(memberships[["IIGO"]]$Begin), "mdate")
  expect_false(any(grepl("/", memberships[["IIGO"]]$Begin)))
  expect_false(any(grepl("^[:alpha:]$",
                         memberships[["IIGO"]]$Begin)))
  expect_false(any(grepl("^[:digit:]{2}$",
                         memberships[["IIGO"]]$Begin)))
  expect_false(any(grepl("^[:digit:]{3}$",
                         memberships[["IIGO"]]$Begin)))
  expect_false(any(grepl("^[:digit:]{1}$",
                         memberships[["IIGO"]]$Begin)))
})

# # Dataset should be ordered according to the "Begin" column
# test_that("dataset is arranged by the `Begin` variable", {
#   expect_true(memberships[["IIGO"]]$Begin[1] <
#                 memberships[["IIGO"]]$Begin[100])
#   expect_true(memberships[["IIGO"]]$Begin[120] <
#                 memberships[["IIGO"]]$Begin[220])
#   expect_true(memberships[["IIGO"]]$Begin[250] <
#                 memberships[["IIGO"]]$Begin[350])
# })
