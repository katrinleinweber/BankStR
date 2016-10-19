context("Data bundled with BankStR package")

test_that("Variable names of the imported dataframes: ", {
  expect_equal(
    names(read_sparda("../../data/umsaetze-1234567-1970-01-31-23-42-00.csv")),
    c("Buchungstag", "Wertstellungstag", "Verwendungszweck", "Umsatz")
  )
  expect_equal(
    names(read_sparkasse("../../data/19730303-12345678-umsatz.CSV")),
    c("Auftragskonto", "Buchungstag", "Valutadatum", "Buchungstext",
      "Verwendungszweck", "Beguenstigter_Zahlungspflichtiger",
      "Kontonummer", "BLZ", "Betrag", "Waehrung", "Info"
    )
  )
  expect_equal(
    names(read_wustenrot("../../data/1234567890_19730303_19730323.csv")),
    c("Datum", "Wertstellung", "Vorgangsart",
      "Buchungsinformationen", "Betrag"
    )
  )
}
)