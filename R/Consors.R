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
    df <- read.csv2(file = file, header = FALSE, skip = 1, encoding = "latin1", stringsAsFactors = FALSE)

    # Remove , and . to convert it to numeric
    df["V9"] <- as.numeric(mapply(gsub, "[,.]", "", df["V9"]))/100

    df <- clean_bank_df(df, variables = c("V2", "V7", "V9"), dateformat = "%d.%m.%Y")

    return(df)
}
