# memberships datacube

The `manyios::memberships` datacube is a list containing 2 datasets:
MIGO and IIGO. It is a work-in-progress, so please let us know if you
have any comments or suggestions.

## Usage

``` r
memberships
```

## Format

- MIGO: :

  A dataset with 80,624 observations and 9 variables: igoID, stateID,
  StateName, membership, Year, Begin, End, cowID, and active.

- IIGO: :

  A dataset with 3,502 observations and 7 variables: stateID, StateName,
  igoID, Title, Begin, End, and Year.

For more information and references to each of the datasets used, please
use the
[`manydata::call_sources()`](https://www.manydata.ch/reference/call_sources.html)
and
[`manydata::compare_dimensions()`](https://www.manydata.ch/reference/compare_dimensions.html)
functions.

## Source

- Roger, Charles B. and Sam S. Rowan. 2022. 'The New Terrain of Global
  Governance: Mapping Membership in Informal IOs'. *Journal of Conflict
  Resolution* 67.6.

- Vabulas, Felicity, and Duncan Snidal. 2021. 'Cooperation under
  autonomy: Building and analyzing the Informal Intergovernmental
  Organizations 2.0 dataset'. *Journal of Peace Research*, 58.4, pp.
  859-869.

## Details

    #> $MIGO
    #> -------------------------------------------------------
    #> |  Variable  |  Class  |  Obs  |  Missing  |  Miss %  |
    #> -------------------------------------------------------
    #> |igoID       |character|  80624|          0|         0|
    #> |stateID     |character|  80356|        268|      0.33|
    #> |StateName   |character|  80624|          0|         0|
    #> |membership  |character|  80624|          0|         0|
    #> |Year        |mdate    |  80624|          0|         0|
    #> |Begin       |mdate    |  80624|          0|         0|
    #> |End         |mdate    |  80624|          0|         0|
    #> |cowID       |character|  80624|          0|         0|
    #> |active      |character|  80624|          0|         0|
    #> -------------------------------------------------------
    #>
    #>
    #> $IIGO
    #> -------------------------------------------------------
    #> |  Variable  |  Class  |  Obs  |  Missing  |  Miss %  |
    #> -------------------------------------------------------
    #> |stateID     |character|   3491|         11|      0.31|
    #> |StateName   |character|   3502|          0|         0|
    #> |igoID       |character|   3493|          9|      0.26|
    #> |Title       |character|   3502|          0|         0|
    #> |Begin       |mdate    |   3269|        233|      6.65|
    #> |End         |mdate    |   1065|       2437|     69.59|
    #> |Year        |mdate    |   3502|          0|         0|
    #> -------------------------------------------------------

## Mapping

|           |            |              |
|-----------|------------|--------------|
| *manyios* | *MIGO*     | *IIGO*       |
| igoID     |            | Abbreviation |
| stateID   |            |              |
| StateName | state_name |              |
| cowID     | ccode      |              |
| Title     | IIGO Name  |              |
