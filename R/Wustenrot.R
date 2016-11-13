#' Read & clean Wustenrot CSVs
#'
#' @param file A CSV file exported from your Wustenrot Giro-Konto | Kontoums\303\244tze
#'
#' @return A dataframe
#'
#' @examples
#' read_wustenrot('data/wustenrot_1234567890_YYYYMMDD_YYYYMMDD.csv')

read_wustenrot <- function(file) {
    df <- read.csv2(file = file)
    
    df <- clean_bank_df(df, variables = c("Wertstellung", "Buchungsinformationen", "Betrag"), 
        dateformat = "%d.%m.%y")
    
    return(df)
}
