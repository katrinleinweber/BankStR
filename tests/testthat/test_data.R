context("Data bundled with BankStR package")

test_that("Variable names of the imported dataframes: ", {
  expect_equal(
    names(read_sparda("../../data/sparda_umsaetze-1234567-YYYY-MM-DD-HH-MM-SS.csv")),
    names(read_sparkasse("../../data/sparkasse_YYYYMMDD-12345678-umsatz.CSV")),
    names(read_wustenrot("../../data/wustenrot_1234567890_YYYYMMDD_YYYYMMDD.csv")),
    c("day", "purpose", "amount")
  )
}
)