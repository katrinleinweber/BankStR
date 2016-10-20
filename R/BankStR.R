#' Clean dataframes after importing from bank's CSV
#'
#' @param df The dataframe to clean after importing/reading from a bank's CSV
#' file.
#'
#' @param variables
#'
#' @return A dataframe reduced to the variables 'day', 'purpose' and 'amount' of
#' the transactions
#'
#' @export
clean_bank_df <- function(df, variables, dateformat) {
    
    # reduce to common & useful columns
    df <- subset(df, select = variables)
    
    # harmonise names
    names(df) <- make.names(c("day", "purpose", "amount"))
    
    # format as date
    df[, "day"] <- as.Date(x = df[, "day"], format = dateformat)
    
    return(df)
}
