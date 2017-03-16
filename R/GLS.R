#' Read & clean CSVs from the GLS Gemeinschaftsbank eG
#'
#' @param file A CSV file exported from your GLS online account | Finanzen & Umsätze | Umsatzexport
#'
#' @return A dataframe reduced to the variables 'DATE', 'DESCRIPTION' and 'AMOUNT' of
#' the transactions
#'
#' @examples
#' read_gls('data/gls_Umsaetze_DDMMYYYY_bis_DDMMYYYY_KTO1234567890_DDMMYYYY.csv')
#'
#' @export

read_gls <- function(file) {
    df <- readr::read_csv2(file = file, col_types = "nccccccccccccccccccnnc")

    df <- clean_bank_df(df, variables = c("Wertstellung", "Buchungstext", "Betrag"), dateformat = "%d.%m.%Y")

    return(df)
}
