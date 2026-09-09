# Changelog

## manyios 0.1.0

### Package

- Updated the package logo in the README to the new Palais des Nations
  design
- Updated templates, workflows, and CONTRIBUTING

### Data

- Preparation scripts now call `manystates::code_states()` and
  `manytreaties::standardise_titles()`
- Rebuilt `organizations` from the DIGO, IIGO, and TRANSACCESS
  preparation scripts
- Fixed the mis-decoded titles in `organizations$TRANSACCESS` by reading
  the source as latin1, which repairs the Comunidade dos Paises de
  Lingua Portuguesa and Fondo Indigena names
- Fixed two titles in `organizations$DIGO` that carried a stray source
  byte as the text “ab” and “90”
- Fixed the broken pipe in `prepare-DIGO.R` that stopped the script from
  running
- Closed [\#18](https://github.com/globalgov/manyios/issues/18) by
  reading `informals_v3.dta` as UTF-8, which repairs the mis-decoded Sao
  Tome and Cote d’Ivoire state names in `memberships$MIGO`
- Closed [\#18](https://github.com/globalgov/manyios/issues/18) by
  recoding `memberships$MIGO` with `manystates::code_states()`, which
  resolves the two missing `stateID` values and updates Algeria from
  `ALG` to `DZA`
- Recoded `memberships$IIGO` with `manystates::code_states()`, which
  resolves the missing `stateID` for the Democratic Republic of the
  Congo, corrects the double match `GIN - GNQ` for Equatorial Guinea to
  `GNQ`, updates Algeria from `ALG` to `DZA`, and codes Yugoslavia as
  its successor `SRB`

## manyios 0.0.2

2025-06-02

### Package

- Closed [\#7](https://github.com/globalgov/manyios/issues/7) adding
  website and new package logo
- Closed [\#11](https://github.com/globalgov/manyios/issues/11) by
  updating documentation to make it easier to retrieve information on
  data sources
- Closed [\#13](https://github.com/globalgov/manyios/issues/13) by
  changing package name to manyios and updating references to manyigos
  across files

### Data

- Added `memberships$MIGO` dataset
