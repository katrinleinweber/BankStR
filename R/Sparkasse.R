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
#' read_sparkasse('data/sparkasse_YYYYMMDD-12345678-umsatz.CSV')

read_sparkasse <- function(file) {
    df <- read.csv2(file, encoding = "latin1")
    
    df <- clean_bank_df(df, variables = c("Valutadatum", "Verwendungszweck", "Betrag"), 
        dateformat = "%d.%m.%y")
    
    return(df)
}
