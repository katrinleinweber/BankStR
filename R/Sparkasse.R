#' Read & clean Sparkasse CSVs
#'
#' Uses latin1 encoding and adjusts column names.
#'
#' @param file The CSV file that you downlaoded from your Sparkasse under
#' Postfach | Funktionen | Giro... | Dokumentenuebersicht aufrufen |
#' Funktionen | Export | Format: CSV...
#'
#' @return A dataframe
#'
#' @examples
#' read_sparkasse('data/19730303-12345678-umsatz.CSV')

read_sparkasse <- function(file) {
    df <- read.csv2(file, encoding = "latin1")

    # correct column name
    names(df)[6] <- make.names("Beguenstigter_Zahlungspflichtiger")

    return(df)
}
