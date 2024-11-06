library(testthat)

#Test 1:
test_that("Counts unique values correctly when vectors contain no NA values", {
  # Dataset with no NA values and only atomic values
  fruit_data_test_1 <- data.frame(
    fruit = c("Apple", "Apple", "Apple", "Banana", "Banana", "Orange", "Orange"),
    color = c("red", "green", "yellow", "yellow", "brown", "orange", "orange")
  )
  test_result_1 <- group_unique_counts(fruit_data_test_1, fruit, color, na.rm = TRUE)
  # Check that the unique counts per group are accurate
  expect_equal(nrow(test_result_1), 3)  # Three unique "x" groups: Apple, Banana, Orange
  expect_equal(test_result_1$count[test_result_1$fruit == "Apple"], 3)  # "Apple" has 3 unique "y" colors: red, yellow, and green
})


# Test 2:
test_that("Handles vectors with NA values by excluding them when na.rm = TRUE", {
  # Original fruit_data with NA values
  fruit_data_test_2 <- data.frame(
    fruit = c("Apple", "Apple", "Apple", "Apple", "Banana", "Banana", "Banana", "Orange", "Orange", "Orange", "Orange", "Orange"),
    color = c("red", "red", "green", "yellow", "yellow", "brown", "yellow", "orange", "orange", "orange", "orange", NA)
  )
  test_result_2 <- group_unique_counts(fruit_data_test_2, fruit, color, na.rm = TRUE)
  # Check that the function correctly counts unique values, excluding NA
  expect_equal(nrow(test_result_2), 3)  # Three unique "x" groups: Apple, Banana, Orange
  expect_equal(test_result_2$count[test_result_2$fruit == "Orange"], 1)  # "Orange" has 1 unique color excluding NA
})


#Test 3:
test_that("Returns an error when vectors have zero length", {
  # Creating an empty dataset
  fruit_data_test_3 <- data.frame(
    fruit = character(0),
    color = character(0)
  )
  # Expect an error when applying the function with zero-length vectors
  expect_error(group_unique_counts(fruit_data_test_3, fruit, color, na.rm = TRUE))
})
