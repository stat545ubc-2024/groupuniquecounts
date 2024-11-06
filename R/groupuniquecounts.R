#' Group Unique Counts
#'
#' This function groups a data frame by a specified column "x" and counts the distinct values in another specified column "y". It also provides checks for the validity of inputs.
#'
#' @param data A data frame to be processed. This parameter is essential as the function operates on a data frame structure. Named `data` to indicate that this is the dataset the function will work with.
#' @param x A column name to group by. This parameter should be a valid column in the data frame, and it allows for aggregation based on unique values. Named "x" for simplicity, and because x is typically used for independent variables.
#' @param y A column name for counting distinct values. This must be an atomic type to ensure accurate counting of unique entries. Named "y" for simplicity, and because y is typically used for dependent variables. The number of unique values in column "y" per group depends on what "x" is chosen for grouping.
#' @param na.rm A logical value indicating whether to remove NA values when counting (default is FALSE). Named "na.rm" to maintain consistency with the base function's name.
#' @param ... Additional arguments passed to the `summarise` function. Named "..." to maintain consistency with R’s convention.
#' @return A data frame with one column for the values of `x` and another for the corresponding distinct counts of `y`.
#' @examples
#' group_unique_counts(mtcars, cyl, gear)
#' group_unique_counts(mtcars, cyl, carb, na.rm = TRUE)

#' @export
#' @importFrom magrittr %>%
group_unique_counts <- function(data, x, y, na.rm = FALSE, ...) {
  # Check if input is a data frame
  if (!is.data.frame(data))
    stop("Input data must be a data frame.")
  # Check if specified columns exist
  if (!all(c(deparse(substitute(x)), deparse(substitute(y))) %in% colnames(data))) {
    stop("Specified columns must exist in the data frame.")
  }
  # Check if 'y' column is atomic
  if (!is.atomic(data[[deparse(substitute(y))]])) {
    stop("The column for counting distinct values must be of an atomic type.")
  }
  # Warn if grouping by a continuous variable
  if (is.numeric(data[[deparse(substitute(x))]])) {
    warning("Grouping by a continuous variable. Ensure this is intended.")
  }
  # Check if either column has zero length
  if (nrow(data) == 0 || length(data[[deparse(substitute(x))]]) == 0 || length(data[[deparse(substitute(y))]]) == 0) {
    stop("Input columns must have non-zero length.")
  }
  # Perform grouping and counting
  data %>%
    dplyr::group_by({{ x }}) %>%
    dplyr::summarise(count = dplyr::n_distinct({{ y }}, na.rm = na.rm), ...)
}


