# Find international organisations in text

This function allows for the identification of international
organizations in a vector of texts.

## Usage

``` r
code_orgs(text, code = TRUE, max_count = 1)
```

## Arguments

- text:

  A vector of text to search for organization names within.

- code:

  Logical whether the function should return the four- to five-letter
  abbreviation or the name of the organization. For the complete list of
  entities and their search terms, run the function without an argument
  (i.e. `code_orgs()`). Updates and suggestions welcome.

- max_count:

  Integer how many organizations to search for in each element of the
  vector. Where more than one organization is matched, the organizations
  are returned as a set, i.e. in the format "{UNORG,EURO}". By default
  `max_count = 1`, which will just return the first match.

## Examples

``` r
code_orgs(c("We visited the United Nations",
  "This was a European Union Resolution",
  "Maybe it was Mercosur",
  "New Zealand is a member of the Pacific Island Forum"))
#> [1] "UNORG" "EURO"  "MCSUR" "PASIF"
```
