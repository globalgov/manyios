# Test if the dataset meets the many packages universe requirements

# Report missing values
test_that("missing observations are reported correctly", {
  expect_false(any(grepl("^n/a$", organizations[["TRANSACCESS"]])))
  expect_false(any(grepl("^N/A$", organizations[["TRANSACCESS"]])))
  expect_false(any(grepl("^\\s$", organizations[["TRANSACCESS"]])))
  expect_false(any(grepl("^\\.$", organizations[["TRANSACCESS"]])))
  expect_false(any(grepl("N\\.A\\.$", organizations[["TRANSACCESS"]])))
  expect_false(any(grepl("n\\.a\\.$", organizations[["TRANSACCESS"]])))
})

# Date columns should be in mdate class
test_that("Columns are not in date, POSIXct or POSIXlt class", {
  expect_false(any(lubridate::is.Date(organizations[["TRANSACCESS"]])))
  expect_false(any(lubridate::is.POSIXct(organizations[["TRANSACCESS"]])))
  expect_false(any(lubridate::is.POSIXlt(organizations[["TRANSACCESS"]])))
})
