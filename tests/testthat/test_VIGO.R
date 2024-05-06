# Test if the dataset meets the many packages universe requirements

# Report missing values
test_that("missing observations are reported correctly", {
  expect_false(any(grepl("^n/a$", organizations[["VIGO"]])))
  expect_false(any(grepl("^N/A$", organizations[["VIGO"]])))
  expect_false(any(grepl("^\\s$", organizations[["VIGO"]])))
  expect_false(any(grepl("^\\.$", organizations[["VIGO"]])))
  expect_false(any(grepl("N\\.A\\.$", organizations[["VIGO"]])))
  expect_false(any(grepl("n\\.a\\.$", organizations[["VIGO"]])))
})

# Date columns should be in mdate class
test_that("Columns are not in date, POSIXct or POSIXlt class", {
  expect_false(any(lubridate::is.Date(organizations[["VIGO"]])))
  expect_false(any(lubridate::is.POSIXct(organizations[["VIGO"]])))
  expect_false(any(lubridate::is.POSIXlt(organizations[["VIGO"]])))
})
