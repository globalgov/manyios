# Contributing

Contributions to [manyios](https://github.com/globalgov/manyios),
whether in the form of issue identification, bug fixes, new code or
documentation are encouraged and welcome, both from research assistants
and (early) users of the package:

- [Submit an issue](#issues)
- [Fix a bug or implement new features](#adding-new-code)
- [Document existing code](#documentation)

This outlines how to propose a change to a package from the Global
Governance Observatory’s ecosystem. Please note that the `manyios`
project is released with a [Contributor Code of
Conduct](https://globalgov.github.io/manyios/CODE_OF_CONDUCT.md). By
contributing to this project, you agree to abide by its terms.

## Issues

Please use the issue tracker on GitHub to identify problems or suggest
new functionality, before submitting changes to the code. We use issues
to identify bugs and tasks, discuss feature requests, and to track
implementation of changes.

When submitting an issue, please provide at least a ‘Type’ label that
best describes what the issue is about. The most useful issues are ones
that precisely identify a bug, or propose a test that should pass but
instead fails.

## Adding new code

Independent or assigned code contributions are most welcome. When
writing new code, please follow [tidyverse style
guide](https://style.tidyverse.org/index.html) which is based on
[standard R guidelines](https://google.github.io/styleguide/Rguide.xml).

It can help to use packages such as `lintr` and `goodpractice` to ensure
these are followed. These packages are incorporated into the checks made
when a pull request is made. The `styler` package fixes in a
non-invasive way the code to adhere to the tidyverse formatting rules,
and it also provides an RStudio Addins to help with this task. To run
the `lintr` and `goodpractice` checks or use `styler` in a file run:

``` r

# basic lintr checking
lintr::lint_package(path = "manyios/")

# goodpractices checks. Exclude length 80
goodpractice::gp(path = "manyios/",
   checks = all_checks()[-c(8)])

# styler fix some of the styling issues
styler::style_file("filePath")
```

## Writing in markdown/roxygen

When writing passages of text in markdown or roxygen documents, please
consider that text should be written such that sentences, and sometimes
clauses of a sentence, start on a new line. This facilitates comparison
of documents and feedback on GitHub. Lines of text should, ideally, not
be over 80 characters in length.

## Pull request process

The title of your PR should briefly describe the change. Please include
a summary of the changes and which issues are fixed and the relevant
motivation and context. List any dependencies that are required for this
change, indicating whether this is a major (breaking), minor, or patch
change. The body of your PR should contain `Fixes #issue-number`. A
checklist is provided to check off the cases as the different elements
listed have been completed to make sure all the steps have been
respected. Make sure the package passes R CMD check by running
`devtools::check()` before commiting changes to a pull request.

If you want to make a bigger change, it’s a good idea to first file an
issue and make sure someone from the team agrees that it’s needed before
openning a pull request. If you’ve found a bug, please file an issue
that illustrates the bug with a minimal
[reprex](https://www.tidyverse.org/help/#reprex).

Please follow the manyios pull request guideline
(<https://github.com/globalgov/manyios/blob/main/.github/pull_request_template.md>)

### Branches

We use two **main branches** in this project:

1.  The `origin/main` branch is reserved for fully functional releases
    of the model. When the `develop` branch reaches a stable point, a
    code maintainer merges it back into to the `master` branch, and tags
    it with a release number there.

2.  The `origin/develop` branch reflects the latest model development
    stage. Contributers are encouraged to submit minor changes to this
    branch that enhance existing functionality. New features that may
    break existing functionality should be committed to supporting
    branches.

We use two types of **supporting branches**:

3.  *Feature branches* are used to develop new functionality. They exist
    as long as the feature is developed, and are then either merged into
    the `develop` branch for incorporation in a release, or deleted if
    the feature is abandoned. Feature branches should branch off from
    `origin/develop`.

4.  *Hotfix branches* are used to provide fixes to severe bugs in the
    `main` branch. That way, the code maintainer does not have to
    incorporate (potentially unstable) changes from the `develop` branch
    to fix an issue. Branch names should be prefixed with `hotfix-`.

This branching model is based on:
<https://nvie.com/posts/a-successful-git-branching-model/>.

### Main Branch (code maintainer only)

To create a release version of the code:

1.  Ensure that the repository is up-to-date: `git pull`.
2.  Switch to the **main** branch: `git checkout master`.
3.  Merge changes to the **develop** branch:
    `git merge --no-ff develop`.
4.  Tag release version: `git tag -a VX.Y.Z -m "VERSION-NAME"`.
5.  Push changes to this repository `git push origin master --tags`.

### Develop Branch (minor changes to existing functionality)

To make minor changes directly to the `develop` branch, follow standard
git procedures:

1.  Make sure you switched to the **develop** branch of the project:
    `git checkout -b develop`.
2.  Make sure your local version of the code is up-to-date:
    `git pull origin develop`.
3.  Make your changes
4.  Stage your changes for a commit: `git add PATH-TO-CHANGED-FILE`.
5.  Commit your changes [using an appropriate
    message](#commit-messages): `git commit -m "DESCRIPTION"`.
6.  Push your commit: `git push origin develop`.

### Feature Branches (new functionality)

To create a new feature branch: `git checkout -b myfeature develop`.

To merge a feature branch back into `develop`:

    git checkout develop
    git merge --no-ff myfeature
    git branch -d myfeature
    git push origin develop

### Hotfix Branches (to fix critical bugs in release versions)

To create a new hotfix branch: `git checkout -b hotfix-VERSION master`.

To merge a hotfix back into `master` (code maintainer only):

    git checkout master
    git merge --no-ff hotfix-VERSION
    git tag -a VERSION
    git push origin develop

And into develop:

    git checkout develop
    git merge --no-ff hotfix-VERSION

Every hotfix should increment the [PATCH digit of the version
number](#versioning): a hotfix branch for `V1.3.0` is named
`hotfix-V1.3.1`, and the new release is tagged as `V1.3.1`.

Once merged into `master` and `develop`, the hotfix branch can be
deleted: `git branch -d hotfix-VERSION`.

### Commit messages

Commits that relate to existing issues should reference the updated
status of those issues, and mention the issue number (preceded by a hash
symbol: \#) in the commit description:

`Resolved #31 by adding a new function that does things, also updated documentation`

Where the issue hash (i.e. #31) is preceded by `resolve`, `resolves`,
`resolved`, `close`, `closes`, `closed`, `fix`, `fixes`, or `fixed`
(capitalised or not), the status of the issue(s) mentioned is updated
automatically. Our current syntactical standard is to mention the issue
first and then provide a short description of what the committed changes
do in relation to that issue. Any ancillary changes can be mentioned
after a comma.

It should all be written in a single line, like so:
\#`{verb} {issue} {describe main action/changes}, {additional actions/changes}`.

Note that it is important to write a structured commit message to
improve efficiency in collaboration. Please make sure of: \* Making the
title clear and concise with correct reference to an issue as described
above. \* Using a subject line in the description part when the commit
message outlines many different changes. \* Explaining in details the
changes made and why you made them by using bullet points. \* Separating
each paragraph with a blank line.

To keep the tracking and, if needed, the reversing of changes as easy as
possible, please follow the [‘atomic
approach’](https://www.freshconsulting.com/insights/blog/atomic-commits/)
when committing changes. Each commit should address separate aspects as
much as possible, such as making bug fixes and additions of data in
separate commits.

### Testing

We use the [testthat](https://testthat.r-lib.org/) package (edition 3,
parallel) to write unit tests. Tests live in
[tests/testthat/](https://globalgov.github.io/tests/testthat).

You should verify that all tests pass before issuing a commit to
existing code. To run the full suite: `devtools::test()`. To run one
file: `devtools::test(filter = "IIGO")`, or
`testthat::test_file("tests/testthat/test_IIGO.R")`.

Most of the suite tests *data*, not functions. There is one test file
for each dataset in a datacube, named `test_<DATASET>.R`
(e.g. [test_IIGO.R](https://globalgov.github.io/tests/testthat/test_IIGO.R)),
and each checks that the dataset meets the many packages universe
requirements: missing values are reported as `NA` and not as `"n/a"`,
`"."` or similar; date columns are in `mdate` class and not
`Date`/`POSIXct`/`POSIXlt`; dates are ordered; and the ID and title
columns are present and unique. When you add a dataset, copy the test
file of an existing dataset in the same datacube and adapt it.

Tests of exported functions follow the tidyverse naming convention
instead: `test-FILENAME_IN_R_DIRECTORY.R`,
e.g. [test-code_orgs.R](https://globalgov.github.io/tests/testthat/test-code_orgs.R)
for [R/code_orgs.R](https://globalgov.github.io/R/code_orgs.R).

## Documentation

A final way of contributing to the package is in developing the
vignettes/articles that illustrate the value added in the package.
Please contact us directly with proposals for updating the
documentation, or submit an issue if existing documentation is unclear.

## Versioning

Note that the package is versioned according to [semantic
versioning](https://www.jvandemo.com/a-simple-guide-to-semantic-versioning/).
This means that versions follow the Major.Minor.Patch semantic format.

## Package architecture

### Project overview

`manyios` is an R data package (part of the
[globalgov](https://github.com/globalgov) “many packages” ecosystem) on
intergovernmental organisations in the international system across time.
It ships two *datacubes*, each of which is a named list of related
datasets that are cleaned into a common format so that
[manydata](https://www.manydata.ch/) can compare and consolidate them:

- `organizations`: the organisations themselves (`DIGO`, `IIGO`,
  `TRANSACCESS`, and others).
- `memberships`: which state belongs to which organisation, and when
  (`COW_MEM`, `IIGO_MEM`, `MIGO`, and others).

Division of labour to keep in mind when adding code:

- [manydata](https://www.manydata.ch/): the core package — discovering,
  comparing, and consolidating datacubes.
- `{manypkgs}`: the tools for *building* a many package, and the
  conventions the tests here enforce.
- [manystates](https://globalgov.github.io/manystates/): state names and
  `stateID` coding, via `manystates::code_states()`.
- `{manytreaties}`: treaty titles and `treatyID` coding, via
  `manytreaties::standardise_titles()`.
- [manyios](https://github.com/globalgov/manyios) (this package): the
  data on intergovernmental organisations, and
  [`code_orgs()`](https://globalgov.github.io/manyios/reference/code_orgs.md).

Almost all of the value of this package is in the data and in the
scripts that prepare it, so the conventions below concern data more than
functions.

### Common commands

This is a standard R package developed with `devtools`/`roxygen2`. Run
these from an R console with the working directory set to the package
root (or via `Rscript -e`).

- Load package for interactive development: `devtools::load_all()`
- Regenerate docs & NAMESPACE after editing roxygen comments:
  `devtools::document()`
- Run full test suite: `devtools::test()`
- Run a single test file: `devtools::test(filter = "IIGO")` (matches
  `test_IIGO.R`)
- Full package check (mirrors CI): `devtools::check()` or
  [`rcmdcheck::rcmdcheck()`](http://r-lib.github.io/rcmdcheck/reference/rcmdcheck.md)
- Lint:
  [`lintr::lint_package()`](https://lintr.r-lib.org/reference/lint.html)
- Spell check:
  [`spelling::spell_check_package()`](https://docs.ropensci.org/spelling//reference/spell_check_package.html)
- Rebuild `README.md` from `README.Rmd`: `devtools::build_readme()`
- Build pkgdown site locally:
  [`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html)

There is no non-R build system — no package.json/Makefile. Roxygen is
configured with `markdown = TRUE`; `NAMESPACE` and all `man/*.Rd` files
are generated — never hand-edit them.

### File organization

- `data/organizations.rda`, `data/memberships.rda` — the two datacubes.
  **Generated. Never edit these directly.**
- `data-raw/<datacube>/<dataset>/` — one directory for each dataset,
  holding the raw source file, a `<DATASET>.bib` citation, and a
  `prepare-<DATASET>.R` script that builds it.
- `R/manyios-organizations.R`, `R/manyios-memberships.R` — roxygen
  documentation for the datacubes only. The `@format` and `@source`
  sections are computed from the data at build time, so they do not need
  updating when a dataset gains rows.
- `R/code_orgs.R` — the one exported function.
- `tests/testthat/` — see [Testing](#testing) above.

### Preparing data

To add or update a dataset:

1.  Put the raw source file in `data-raw/<datacube>/<dataset>/`,
    alongside a `.bib` entry for it.
2.  Write or edit `prepare-<DATASET>.R` in that directory. Use
    `manypkgs::import_data()` to write the result into the datacube,
    `manystates::code_states()` for state names, and
    `manytreaties::standardise_titles()` for treaty titles.
3.  Re-run the script. It rewrites the `.rda` file in `data/`.
4.  Run `devtools::test()`. The dataset test file enforces the many
    packages universe requirements.
5.  Add the dataset to the `reference:` index in `pkgdown/_pkgdown.yml`
    if it is a new datacube.

Every step from the raw file to the released data must be reproducible
from the script, so do not fix a value by hand — fix it in the script.

### Website

The site is built by [pkgdown](https://pkgdown.r-lib.org/) from
[pkgdown/\_pkgdown.yml](https://globalgov.github.io/pkgdown/_pkgdown.yml)
and deployed from
[pushrelease.yml](https://globalgov.github.io/manyios/workflows/pushrelease.yml)
on a merge to `main`.

**Every exported function and datacube must appear in the `reference:`
index.** A topic left out of it fails the build, so the site stops
updating. A helper that users are not meant to call takes
`@keywords internal` instead.

Check before opening a PR:

``` r

pkgdown::check_pkgdown()              # every topic is in the index
pkgdown::build_site(preview = FALSE)  # everything else
```

### `NEWS.md` conventions

The release notes on GitHub are taken from `NEWS.md`.
[pushrelease.yml](https://globalgov.github.io/manyios/workflows/pushrelease.yml)
copies the `# manyios <version>` section verbatim, so a version without
such a section releases with empty notes.
[prchecks.yml](https://globalgov.github.io/manyios/workflows/prchecks.yml)
fails a PR that does not add one.

Group each version’s changes under `##` headings, each appearing at most
once per version: `## Package` (package-wide, website, and
infrastructure changes) first, then `## Data` (changes to the
datacubes), then `## Functions`.

Start each bullet with a verb matching the change type:

- `Added ...` — new data or functionality
- `Fixed ...` — bug fixes; if it relates to a GitHub issue, suffix with
  `(closing #123)`
- `Renamed ... to ...` — dataset, variable, or function name migrations
- `Improved ...` — functional updates to existing behaviour
- `Updated ...` — documentation changes

Keep every bullet to one line of fewer than 81 characters ideally. If a
bullet wraps, it holds too much: shorten it, or split it into a lead
bullet and sub-bullets indented by two spaces. Each bullet stands on its
own, and states what changed, not why or how unless there is space for
context.

If a cited GitHub issue was **not** authored by @jhollway, thank the
author with an `@`-tag in the bullet.

### Branching and CI

- `main` is the release branch; `develop` is the working branch
  (clone/work on `develop`).
- PRs into `main` trigger
  [prchecks.yml](https://globalgov.github.io/manyios/workflows/prchecks.yml):
  R CMD check (macOS/Windows/Linux), binary build, codecov, lintr, spell
  check, and PR metadata checks (DESCRIPTION version bump, a matching
  `NEWS.md` section, PR title/description conventions).
- Merges/pushes to `main` trigger
  [pushrelease.yml](https://globalgov.github.io/manyios/workflows/pushrelease.yml):
  check, auto-bump version tag, GitHub release with binaries and the
  `NEWS.md` section as release notes, then pkgdown site deploy. A
  failing check blocks the release and the deploy.
