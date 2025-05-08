# Test if the dataset meets the many packages universe requirements

# Report missing values
test_that("missing observations are reported correctly", {
  expect_false(any(grepl("^n/a$", memberships[["MIGO"]])))
  expect_false(any(grepl("^N/A$", memberships[["MIGO"]])))
  expect_false(any(grepl("^\\s$", memberships[["MIGO"]])))
  expect_false(any(grepl("^\\.$", memberships[["MIGO"]])))
  expect_false(any(grepl("N\\.A\\.$", memberships[["MIGO"]])))
  expect_false(any(grepl("n\\.a\\.$", memberships[["MIGO"]])))
})

# Uniformity tests (agreements have a stateID and Begin columns)
test_that("datasets have the required variables", {
  pointblank::expect_col_exists(memberships[["MIGO"]],
                                pointblank::vars(stateID))
  pointblank::expect_col_exists(memberships[["MIGO"]],
                                pointblank::vars(Begin))
})

# Date columns should be in mdate class
test_that("Columns are not in date, POSIXct or POSIXlt class", {
  expect_false(any(lubridate::is.Date(memberships[["MIGO"]])))
  expect_false(any(lubridate::is.POSIXct(memberships[["MIGO"]])))
  expect_false(any(lubridate::is.POSIXlt(memberships[["MIGO"]])))
})

# Dates are standardized for mandatory column
test_that("Column `Begin` has standardised dates", {
  expect_equal(class(memberships[["MIGO"]]$Begin), "mdate")
  expect_false(any(grepl("/", memberships[["MIGO"]]$Begin)))
  expect_false(any(grepl("^[:alpha:]$",
                         memberships[["MIGO"]]$Begin)))
  expect_false(any(grepl("^[:digit:]{2}$",
                         memberships[["MIGO"]]$Begin)))
  expect_false(any(grepl("^[:digit:]{3}$",
                         memberships[["MIGO"]]$Begin)))
  expect_false(any(grepl("^[:digit:]{1}$",
                         memberships[["MIGO"]]$Begin)))
})

# # Dataset should be ordered according to the "Begin" column
# test_that("dataset is arranged by the `Begin` variable", {
#   expect_true(memberships[["MIGO"]]$Begin[1] <
#                 memberships[["MIGO"]]$Begin[100])
#   expect_true(memberships[["MIGO"]]$Begin[120] <
#                 memberships[["MIGO"]]$Begin[220])
#   expect_true(memberships[["MIGO"]]$Begin[250] <
#                 memberships[["MIGO"]]$Begin[350])
# })
