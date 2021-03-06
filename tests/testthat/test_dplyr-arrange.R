context("dplyr arrange")

# Test objects

test_time <- tibble::tibble(
  group = c("g1", "g1", "g2"),
  date  = c(as.Date("2017-12-01"), as.Date("2017-12-02"), as.Date("2017-12-03")),
  value = c(1, 2, 3)
)

test_tbl_time <- as_tbl_time(test_time, date)
grouped_test  <- group_by(test_tbl_time, group)
grouped_test_time  <- group_by(test_time, group)


# Tests

test_that("arrange works as expected", {
  expect_equal(arrange(test_tbl_time, date),
               arrange(test_time,     date))
})

test_that("arrange works as expected with groups", {
  expect_equal(arrange(grouped_test,      date),
               arrange(grouped_test_time, date))
})

test_that("arrange works as expected with groups and .by_group", {
  expect_equal(arrange(grouped_test,      date, .by_group = TRUE),
               arrange(grouped_test_time, date, .by_group = TRUE))
})

test_that("tbl_time class is retained", {
  expect_is(arrange(test_tbl_time, date), "tbl_time")
})


