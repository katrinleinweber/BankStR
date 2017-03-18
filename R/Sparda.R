#' Read & clean Sparda CSVs
#'
#' Ignores 10 rows of general account info before table of transactions,
#' adjusts column names and deletes useless last row and column.
#'
#' @param file A CSV file exported from your Sparda Konto-Center |
#' Umsaetze | Umsatzsuche.
#'
#' @return A dataframe reduced to the variables 'DATE', 'DESCRIPTION' and 'AMOUNT' of
#' the transactions.
#'
#' @examples
#' read_sparda('data/sparda_umsaetze-1234567-YYYY-MM-DD-HH-MM-SS')
#'
#' @export

read_sparda <- function(file) {
    df <- readr::read_csv2(file = file, skip = 10,
                           col_types = cols_only(Buchungstag = col_guess(),
                                                 Wertstellungstag = col_guess(),
                                                 Verwendungszweck = col_character(),
                                                 Umsatz = col_number()
                                                 )
                           )

    # Remove last row with 'noch nicht ausgef?hrte Ums?tze'; learned from
    # http://r.789695.n4.nabble.com/remove-last-row-of-a-data-frame-td4652858.html
    df <- df[-nrow(df), ]

    df <- clean_bank_df(df, variables = c("Wertstellungstag", "Verwendungszweck", "Umsatz"),
                        dateformat = "%d.%m.%Y"
                        )

    return(df)
}
