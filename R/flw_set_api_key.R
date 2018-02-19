#' Utility function to set API key for the Follow the Money API
#'
#' This function updates the .Renviron file with a new key
#'
#' @export
flw_set_api_key<-function(api_key){
  cat(paste0("follow_the_money_key=",api_key, "\n"),
      file=file.path(normalizePath("~/"), ".Renviron"),
      append=TRUE)
}
