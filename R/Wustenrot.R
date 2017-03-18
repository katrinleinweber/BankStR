#' Read & clean Wustenrot CSVs
#'
#' @param file A CSV file exported from your Wustenrot Giro-Konto | Kontoums\303\244tze
#'
#' @return A dataframe reduced to the variables 'DATE', 'DESCRIPTION' and 'AMOUNT' of
#' the transactions.
#'
#' @export

read_wustenrot <- function(file) {

    df <- readr::read_csv2(file)


    df <- clean_bank_df(df, variables = c("Wertstellung", "Buchungsinformationen", "Betrag"),
                        dateformat = "%d.%m.%Y"
                        )

    return(df)
}
