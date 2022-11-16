# Test if the dataset meets the many packages universe requirements

# Report missing values
test_that("missing observations are reported correctly", {
  expect_false(any(grepl("^n/a$", organizations[["DIGO"]])))
  expect_false(any(grepl("^N/A$", organizations[["DIGO"]])))
  expect_false(any(grepl("^\\s$", organizations[["DIGO"]])))
  expect_false(any(grepl("^\\.$", organizations[["DIGO"]])))
  expect_false(any(grepl("N\\.A\\.$", organizations[["DIGO"]])))
  expect_false(any(grepl("n\\.a\\.$", organizations[["DIGO"]])))
})

# Date columns should be in mdate class
test_that("Columns are not in date, POSIXct or POSIXlt class", {
  expect_false(any(lubridate::is.Date(organizations[["DIGO"]])))
  expect_false(any(lubridate::is.POSIXct(organizations[["DIGO"]])))
  expect_false(any(lubridate::is.POSIXlt(organizations[["DIGO"]])))
})
