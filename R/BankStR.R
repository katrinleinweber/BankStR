#' Clean dataframes after importing from bank's CSV
#'
#' @param df The dataframe to clean after importing/reading from a bank's CSV
#' file.
#'
#' @param variables Names of the variables corresponding to 'DATE', 'DESCRIPTION' and 'AMOUNT'
#'
#' @param dateformat The date format for converting the string in DATE.
#'
#' @return A dataframe reduced to the variables 'DATE', 'DESCRIPTION' and 'AMOUNT' of
#' the transactions.
#'
clean_bank_df <- function(df, variables, dateformat) {

    # reduce to common & useful columns
    df <- subset(df, select = variables)

    # harmonise names & adhere to https://github.com/bhutley/bank-csv-to-ledger
    names(df) <- make.names(c("DATE", "DESCRIPTION", "AMOUNT"))

    # format as date
    df[, "DATE"] <- as.Date(x = df[, "DATE"], format = dateformat)

    # clean up . and ,
    df[, "AMOUNT"] <- gsub(fixed = T, ".", "", df[, "AMOUNT"])
    df[, "AMOUNT"] <- gsub(fixed = T, ",", ".", df[, "AMOUNT"])
    df[, "AMOUNT"] <- as.numeric(df[, "AMOUNT"])

    return(df)
}
