#' Read & clean Sparda CSVs
#'
#' Ignores 10 rows of general account info before table of transactions,
#' adjusts column names and deletes last row and column which contain only
#'
#' @param file A CSV file exported from your Sparda Konto-Center |
#' Umsaetze | Umsatzsuche
#'
#' @return A dataframe with three columns: "DATE", "DESCRIPTION" and "AMOUNT".
#'
#' @examples
#' read_sparda('data/sparda_umsaetze-1234567-YYYY-MM-DD-HH-MM-SS')

read_sparda <- function(file) {
    df <- read.csv2(file = file, header = T, skip = 10, row.names = NULL)
    # Because Buchungs- & Wertstellungstag are often the same, R assumes duplicate row.names, which is not
    # allowed. Thanks to http://stackoverflow.com/a/8854469/4341322.
    
    # Remove last row with 'noch nicht ausgef?hrte Ums?tze'; learned from
    # http://r.789695.n4.nabble.com/remove-last-row-of-a-data-frame-td4652858.html
    df <- df[-nrow(df), ]
    
    # re-align column names after shift due to row.names
    names(df) <- names(df)[2:ncol(df)]
    df[ncol(df)] <- NULL

    df <- clean_bank_df(df, variables = c("Wertstellungstag", "Verwendungszweck", "Umsatz"), dateformat = "%d.%m.%Y")
    
    return(df)
}
