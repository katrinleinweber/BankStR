context("Data bundled with BankStR package")

test_that("Variable names of the imported dataframes: ", {
  expect_equal(
    names(read_sparda("../../data/umsaetze-1234567-1970-01-31-23-42-00.csv")),
    names(read_sparkasse("../../data/19730303-12345678-umsatz.CSV")),
    names(read_wustenrot("../../data/1234567890_19730303_19730323.csv")),
    c("day", "purpose", "amount")
  )
}
)