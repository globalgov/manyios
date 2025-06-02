orgs <- code_orgs() %>% subset(nchar(orgID) > 5 | nchar(orgID) < 4)
orgs <- orgs$orgID

test_that("org codes are all between 4 and 5 characters", {
  expect_equal(orgs, vector("character"))
})

test_that("org codes are all upper case", {
  expect_equal(code_orgs()$orgID, toupper(code_orgs()$orgID))
})

test_that("org codes are unique", {
  expect_false(any(duplicated(orgRegex$orgID)))
})
