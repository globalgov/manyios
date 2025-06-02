
# manyios <img src="man/figures/manyioslogo.png" align="right" width="220"/>

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
![GitHub release (latest by
date)](https://img.shields.io/github/v/release/globalgov/manyhealth)
![GitHub Release
Date](https://img.shields.io/github/release-date/globalgov/manyhealth)
<!-- badges: end -->

`manyios` is a data package within the [many universe of
packages](https://github.com/globalgov). It contains an ensemble of
datasets currently available on intergovernmental organizations in the
world, including information on their beginning and, where applicable,
end dates, state members, and aspects of institutional design. The
package is geared towards global governance research, but can also be
used by anyone interested in international organizations across time.

Please also check out
[`{manydata}`](https://github.com/globalgov/manydata) for more
information about the other packages and tools to handle data from the
many universe of packages.

## How to install:

We’ve made it easier than ever to install and start analysing global
governance data in R. Simply install the core package,
[manydata](https://github.com/globalgov/manydata),as follows, and then
you can discover, install and update various ‘many packages’ from the
console.

``` r
manydata::call_packages() # this prints a list of the publicly available data packages currently available
#manydata::call_packages("manyios") # this downloads and installs the named package
```

## Data included

Once you have installed `{manydata}`, you can see the different datasets
included in a specific datacube in the `{manyios}` package using the
following function.

``` r
manydata::call_sources("manyios", "organizations")
```

Working with ensembles of related data has many advantages for robust
analysis. Just take a look at our vignettes
[here](https://globalgov.github.io/manydata/articles/user.html).

## Many packages

The development of [many
packages](https://github.com/globalgov/manydata) is aimed at collecting,
connecting and correcting network data across issue-domains of global
governance.

While some ‘many packages’ can and do include novel data, much of what
they offer involves standing on the shoulders of giants. ‘many packages’
endeavour to be as transparent as possible about where data comes from,
how it has been coded and/or relabelled, and who has done the work. As
such, we make it easy to cite the datasets you use by listing the
official references using the function above, as well as the package
providers for their work assembling the data by using the function
below.

``` r
citation("manyios")
```

    ## To cite manyios in publications use:
    ## 
    ##   J. Hollway. Intergovernmental Organisations for manydata. 2021.
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {Manyios: Intergovernmental Organisations for manydata},
    ##     author = {James Hollway},
    ##     year = {2021},
    ##     url = {https://github.com/globalgov/manyios},
    ##   }

## Contributing

[`{manypkgs}`](https://github.com/globalgov/manypkgs) also makes it easy
to contribute in lots of different ways.

If you have already developed a dataset salient to this package, please
reach out by flagging this as an
[issue](https://github.com/globalgov/manystates/issues) for us, or by
forking, further developing the package yourself, and opening a [pull
request](https://github.com/globalgov/manystates/pulls) so that your
data can be used easily.

If you have collected or developed other data that may not be best for
this package, but could be useful within the wider universe of
`many packages`, [`{manypkgs}`](https://github.com/globalgov/manypkgs)
includes a number of functions that make it easy to create a new
`many package` and populate it with clean, consistent global governance
data.

If you have any other ideas about how this package or the manydata
universe more broadly might better facilitate your empirical analysis,
we’d be very happy to hear from you.
