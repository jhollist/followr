#' Get contribution data from Follow The Money
#'
#' This package utilizes the Follow The Money API and returns a tidy data frame
#' of political contributions.
#'
#' @param state
#' @param year
#' @param entity
#' @param api_key
#'
#' @export
#' @examples
#' entities <- c(6404143,6480769)
#' flw_get_contributions(entity = entities)
flw_get_contributions <- function(state = NULL, year = NULL, entity = NULL,
                                  api_key = NULL){
  if(is.null(api_key)){
    api_key <- Sys.getenv("follow_the_money_key")
    if(nchar(api_key) == 0){
      stop("No Follow the Money API key found in your environment. Either
           specify one directly or use flw_set_api_key() to set the
           environment variable.")
    }
  }

  # examples
  api_key <- "9632361b2967ef9cab742fb80180d779"
  #eid <- "http://api.followthemoney.org/?y=2016&s=RI&gro=d-id&APIKey=40dc88029cfee6ac7c70142f41f895b2&mode=json"
  #cid <- "http://api.followthemoney.org/?c-t-id=163302&gro=d-id&APIKey=40dc88029cfee6ac7c70142f41f895b2&mode=json"
  ids <- "http://api.followthemoney.org/?s=RI&y=2016&gro=y,c-t-id&APIKey=40dc88029cfee6ac7c70142f41f895b2&mode=json"
  #working <- "https://api.followthemoney.org/?f-fc=2&c-t-eid=6404143&gro=y,d-eid,c-t-id&APIKey=40dc88029cfee6ac7c70142f41f895b2&mode=json&y=2016"

  url <- paste0("https://api.followthemoney.org/?mode=json&gro=c-t-eid,y,d-id", "&APIKey=", api_key)

  if(!is.null(state)){
    url <- paste0(url, "&s=", paste0(state, collapse = ","))
  }

  if(!is.null(year)){
    url <- paste0(url, "&y=", paste0(year,collapse = ","))
  }

  if(!is.null(entity)){
    url <- paste0(url, "&c-t-eid=", paste0(entity, collapse = ","))

  }

  browser()

  request<-httr::GET(url, httr::accept("application/json"))
  content<-jsonlite::fromJSON(httr::content(request, "text", encoding = "UTF-8"))
  records<-content$records #returns nested df's
  contributions <- tbl_df(candidate,
                          office,
                          year,
                          state,
                          contributers = records$Contributor$Contributor,
                          general_industry = records$General_Industry$General_Industry,
                          broad_sector = records$Broad_Sector$Broad_Sector,
                          date = records$Date$Date,
                          street,
                          city,
                          state,
                          zip,
                          ammount)
  View(records)
}
