# Test if the dataset meets the many packages universe requirements

# Report missing values
test_that("missing observations are reported correctly", {
  expect_false(any(grepl("^n/a$", organizations[["MIA"]])))
  expect_false(any(grepl("^N/A$", organizations[["MIA"]])))
  expect_false(any(grepl("^\\s$", organizations[["MIA"]])))
  expect_false(any(grepl("^\\.$", organizations[["MIA"]])))
  expect_false(any(grepl("N\\.A\\.$", organizations[["MIA"]])))
  expect_false(any(grepl("n\\.a\\.$", organizations[["MIA"]])))
})

# Date columns should be in mdate class
test_that("Columns are not in date, POSIXct or POSIXlt class", {
  expect_false(any(lubridate::is.Date(organizations[["MIA"]])))
  expect_false(any(lubridate::is.POSIXct(organizations[["MIA"]])))
  expect_false(any(lubridate::is.POSIXlt(organizations[["MIA"]])))
})
