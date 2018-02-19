#' Get contribution data from Follow The Money
#'
#' This package utilizes the Follow The Money API and returns a tidy data frame
#' of state level political contributions
#'
#' @export
flw_get_contributions <- function(state = NULL, year = NULL, entity = NULL,
                                  api_key = NULL){
  if(is.null(api_key)){
    api_key <- Sys.getenv("follow_the_money_key")
    if(nchar(api_key == 0)){
      stop("No Follow the Money API key found in your environment. Either\n
           specify one directly or use flw_set_api_key() to set the\n
           environment variable.")
    }
  }
  url <- paste0("http://api.followthemoney.org/?mode=json", "&APIKey=", api_key)

  if(!is.null(state)){
    url <- paste0(url, "&s=", state)
  }

  if(!is.null(year)){
    url <- paste0(url,"&y=", year)
  }

  if(!is.null(entity)){

  }

  request<-httr::GET(url, httr::accept("text/plain"))
  httr::content(request, "text", encoding = "UTF-8")
}
