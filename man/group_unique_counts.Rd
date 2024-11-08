% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/groupuniquecounts.R
\name{group_unique_counts}
\alias{group_unique_counts}
\title{Group Unique Counts}
\usage{
group_unique_counts(data, x, y, na.rm = FALSE, ...)
}
\arguments{
\item{data}{A data frame to be processed. This parameter is essential as the function operates on a data frame structure. Named \code{data} to indicate that this is the dataset the function will work with.}

\item{x}{A column name to group by. This parameter should be a valid column in the data frame, and it allows for aggregation based on unique values. Named "x" for simplicity, and because x is typically used for independent variables.}

\item{y}{A column name for counting distinct values. This must be an atomic type to ensure accurate counting of unique entries. Named "y" for simplicity, and because y is typically used for dependent variables. The number of unique values in column "y" per group depends on what "x" is chosen for grouping.}

\item{na.rm}{A logical value indicating whether to remove NA values when counting (default is FALSE). Named "na.rm" to maintain consistency with the base function's name.}

\item{...}{Additional arguments passed to the \code{summarise} function. Named "..." to maintain consistency with R’s convention.}
}
\value{
A data frame with one column for the values of \code{x} and another for the corresponding distinct counts of \code{y}.
}
\description{
This function groups a data frame by a specified column "x" and counts the distinct values in another specified column "y". It also provides checks for the validity of inputs.
}
\examples{
group_unique_counts(mtcars, cyl, gear)
group_unique_counts(mtcars, cyl, carb, na.rm = TRUE)
}
