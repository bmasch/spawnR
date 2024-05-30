loadCAX_xls <- function(folder="../data-raw/CAX"){
  #' Loads the most recent CAX download XLS file in the specified folder
  #'
  #' @param folder String. Default is /data-raw/CAX
  #' @return list
  #' @export
  #' @examples CAX.tables <- loadCAX_xls()
  #'
  require(readxl)
  require(dplyr)
  #get filenames in folder
  fnames <- list.files(folder)
  df <- data.frame(filename=paste(folder,fnames,sep="/")) %>%
    mutate(size=NA,mode=NA,mtime=NA,ctime=NA)
  for(i in 1:nrow(df)){
    print(df$filename[i])
    info <- file.info(df$filename[i])
    df$size[i] <- info$size
    df$mode[i] <- info$mode
    df$mtime[i] <- info$mtime
    df$ctime[i] <- info$ctime
  }
  df <- df %>%
    arrange(desc(mtime))
  fname <- df$filename[1]


  # getting info about all excel sheets
  sheetnames <- readxl::excel_sheets(fname)
  sheets <- lapply(sheetnames, function(x) readxl::read_excel(fname, sheet = x))
  names(sheets) <- sheetnames
  return(sheets)
}


