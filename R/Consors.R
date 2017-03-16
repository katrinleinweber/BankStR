#' Read & clean Consorsbank CSVs
#'
#' Ignores first row of general account info before table of transactions and
#' adjusts variable names.
#'
#' @param file A CSV file exported from your Consorsbank account.
#'
#' @author Wolfgang Lederer
#'
#' @return A dataframe reduced to the variables 'DATE', 'DESCRIPTION' and 'AMOUNT' of
#' the transactions.
#'
#' @examples read_consors('data/consors_Buchungen_200845694.csv')
#'
#' @export

read_consors <- function(file) {
    df <- readr::read_csv2(file, col_names = FALSE, col_types = "ccccccccn", skip = 1)

    df <- clean_bank_df(df, variables = c("X2", "X7", "X9"),
                        dateformat = "%d.%m.%Y"
                        )

    return(df)
}
