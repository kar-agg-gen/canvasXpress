context("canvasXpress Web Charts - Sunburst")


test_that("cXsunburst1", {
    check_ui_test(cXsunburst1())

    warning("Clicking on legend misplace the labels on chart")
})

test_that("cXsunburst2", {
    check_ui_test(cXsunburst2())

    warning("Clicking on legend misplace the labels on chart")
})

test_that("cXsunburst3", {
    check_ui_test(cXsunburst3())
})

test_that("cXsunburst4", {
    check_ui_test(cXsunburst4())
})
