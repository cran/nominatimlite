test_that("Returning empty query", {
  obj <- expect_message(reverse_geo_lite_sf(200, 200))

  expect_true(nrow(obj) == 1)
  expect_true(all(is.na(obj$address)))
})

test_that("Returning error", {
  skip_if_offline()
  expect_error(reverse_geo_lite_sf(0, c(2, 3)))
  expect_error(reverse_geo_lite_sf("a", "a"))
})

test_that("Data format", {
  skip_if_offline()
  expect_true(is.data.frame(reverse_geo_lite_sf(0, 0)))
  expect_s3_class(reverse_geo_lite_sf(0, 0), "sf")
})

test_that("Checking query", {
  skip_if_offline()
  expect_equal(ncol(reverse_geo_lite_sf(0, 0)), 4)
  expect_gt(ncol(reverse_geo_lite_sf(0, 0,
    full_results = TRUE
  )), 4)
  expect_equal(nrow(reverse_geo_lite_sf(0, 40,
    points_only = FALSE,
    custom_query = list(zoom = 0)
  )), 1)

  expect_equal(nrow(reverse_geo_lite_sf(0, 40,
    points_only = FALSE,
    custom_query = list(extratags = 1)
  )), 1)
})