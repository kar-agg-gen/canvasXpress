context("canvasXpress Web Charts - Oncoprint")


test_that("cXoncoprint1", {
    check_ui_test(cXoncoprint1())
})

test_that("cXoncoprint2", {
    check_ui_test(cXoncoprint2())
})

test_that("cXoncoprint3", {
    check_ui_test(cXoncoprint3())
})

test_that("cXoncoprint4", {
    check_ui_test(cXoncoprint4())

    warning("tooltip values are differernt then web example. user may find NAN values instead of zeros (0)")
})
