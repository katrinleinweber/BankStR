#' Read & clean Sparda CSVs
#'
#' Ignores 10 rows of general account info before table of transactions,
#' adjusts column names and deletes last row and column which contain only
#'
#' @param file A CSV file exported from your Sparda Konto-Center |
#' Umsaetze | Umsatzsuche
#'
#' @return A dataframe
#'
#' @examples
#' read_sparda('data/umsaetze-012345678-2016-10-23-42-13-37.csv')

read_sparda <- function(file) {
    df <- read.csv2(file = file, header = T, skip = 10, row.names = NULL)
    # Because Buchungs- & Wertstellungstag are often the same, R assumes duplicate
    # row.names, which is not allowed. Thanks to
    # http://stackoverflow.com/a/8854469/4341322.

    # shift column names due to `row.names = NULL`
    if (names(df[1]) == "row.names") {
        colnames(df) <- colnames(df)[2:ncol(df)]
    }

    # correct column names
    names(df)[5] <- make.names("Waehrung")

    # thanks to
    # http://r.789695.n4.nabble.com/remove-last-row-of-a-data-frame-td4652858.html
    df <- df[-nrow(df), ]
    df <- df[, -ncol(df)]
    return(df)
}
