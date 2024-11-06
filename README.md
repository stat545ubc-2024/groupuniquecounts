
<!-- README.md is generated from README.Rmd. Please edit that file -->

# groupuniquecounts

<!-- badges: start -->
<!-- badges: end -->

The goal of groupuniquecounts is to provide the function
“group_unique_counts”, which groups a data frame by a specified column
“x” and counts the distinct values in another specified column “y”. It
also provides checks for the validity of inputs.

## Installation

You can install the development version of groupuniquecounts from
[GitHub](https://github.com/) with:

``` r
install_github("stat545ubc-2024/groupuniquecounts")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(groupuniquecounts)
group_unique_counts(mtcars, cyl, gear)
#> Warning in group_unique_counts(mtcars, cyl, gear): Grouping by a continuous
#> variable. Ensure this is intended.
#> # A tibble: 3 × 2
#>     cyl count
#>   <dbl> <int>
#> 1     4     3
#> 2     6     3
#> 3     8     2
group_unique_counts(mtcars, cyl, carb, na.rm = TRUE)
#> Warning in group_unique_counts(mtcars, cyl, carb, na.rm = TRUE): Grouping by a
#> continuous variable. Ensure this is intended.
#> # A tibble: 3 × 2
#>     cyl count
#>   <dbl> <int>
#> 1     4     2
#> 2     6     3
#> 3     8     4
```
