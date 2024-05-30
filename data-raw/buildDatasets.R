createCAXrda <- function(CAX){
  #' Writes a list of CAX tables to /data with name CAX.rda
  #'
  #' @param CAX list of data frames created by loadCAX_xls()

  #' @return null
  #' @examples getReport())
  #'
  require(usethis)
  usethis::use_data(CAX, overwrite = TRUE)
}
