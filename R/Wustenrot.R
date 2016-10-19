#' Read & clean Wustenrot CSVs
#'
#' @param file A CSV file exported from your Wustenrot Giro-Konto | Kontoums\303\244tze
#'
#' @return A dataframe
#'
#' @examples
#' read_sparda('data/1234567890_19730303_19730323.csv')

read_wustenrot <- function(file) {
    df <- read.csv2(file = file)

    # nothing special here, but [ ] '?berweisung' should probably be cleaned

    return(df)
}
