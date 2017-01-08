#' Read & clean Wustenrot CSVs
#'
#' @param file A CSV file exported from your Wustenrot Giro-Konto | Kontoums\303\244tze
#'
#' @return A dataframe with three columns: "DATE", "DESCRIPTION" and "AMOUNT".
#'
#' @examples
#' read_wustenrot('data/wustenrot_1234567890_YYYYMMDD_YYYYMMDD.csv')

read_wustenrot <- function(file) {
    
    df <- read.csv2(file, header = FALSE, skip = 1, stringsAsFactors = FALSE)
    # remove empty last column
    df <- df[, -ncol(df)]
    
    # prepare header seperately, because it does not end with ;
    # data rows have trailing ; => error in read.table
    header <- readLines(file, n = 1)
    names(df) <- unlist(strsplit(header, ";"))

    
    df <- clean_bank_df(df, variables = c("Wertstellung", "Buchungsinformationen", "Betrag"), dateformat = "%d.%m.%Y")
    return(df)
}
