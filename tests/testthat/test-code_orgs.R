orgs <- code_orgs() %>% dplyr::filter(nchar(orgID) > 5 | nchar(orgID) < 4) %>% 
  dplyr::pull(orgID)


test_that("org codes are unique", {
  expect_false(any(duplicated(orgRegex$orgID)))
})
