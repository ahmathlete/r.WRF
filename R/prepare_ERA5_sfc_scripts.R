#' @title Prepare python scripts to get Surface Data on daily basis from ERA5 Archive
#' @description A function to prepare python scripts to download ERA5 data,
#' mainly for WRF modelling.
#' @param DATE A character indicate on which date (e.g. "1988-08-05") or
#' time step (e.g. "1988-08-05 13:00:00") the data should be downloaded. default
#' is "1988-08-05".
#' @param VARS A character of variables to be downloaded. Please refer to the ERA5 Catalogue.
#' Default is '34.128/134.128/151.128/165.128/166.128/167.128' which includes:
#' 34 is Sea surface temperature
#' 134 is Surface pressure
#' 151 is Mean sea level pressure
#' 165 is 10 metre U wind component
#' 166 is 10 metre V wind component
#' 167 is 2 metre temperature
#' @param AREA A character of the area of interest which is specified as N, W, S, E.
#' Default is  "square-bracket90, -180, -90, 180,square-bracket".
#' @param RES Resolution of the data to be downloaded. Default is "0.25/0.25"
#' @param FORMAT Format of the data, either grib or netcdf. Default is grib.
#' @param PATH A chacter pointing to where the genereted script will be saved.
#' @author Ahmed Homoudi
#' @export

prepare_ERA5_sfc_scripts <- function(DATE = "1988-08-5",
                                     VARS = "34.128/134.128/151.128/165.128/166.128/167.128",
                                     AREA = "[ 90, -180, -90, 180, ]",
                                     RES = "0.25/0.25",
                                     FORMAT = "grib",
                                     PATH = "~/") {




  # extract variables from date

  YEAR <- format(as.Date(DATE), "%Y")
  MONTH <- format(as.Date(DATE), "%m")
  DAY <- format(as.Date(DATE), "%d")

  message("Downloading the daily time step from 00 to 24 by 1 hour interval")

  TIME <- paste0(
      "00:00:00/01:00:00/02:00:00/03:00:00/04:00:00/05:00:00/06:00:00/",
      "07:00:00/08:00:00/09:00:00/10:00:00/11:00:00/12:00:00/13:00:00/",
      "14:00:00/15:00:00/16:00:00/17:00:00/18:00:00/19:00:00/20:00:00/",
      "21:00:00/22:00:00/23:00:00"
    )

  # set file name
  HOUR <-"00-23"

  if (FORMAT == "grib") {
    FILENAME <- paste0(
      "ERA5_SFC_",
      YEAR,
      "_",
      MONTH,
      "_",
      DAY,
      "_",
      HOUR,
      ".grib"
    )
  } else {
    FILENAME <- paste0(
      "ERA5_SFC_",
      YEAR,
      "_",
      MONTH,
      "_",
      DAY,
      "_",
      HOUR,
      ".nc"
    )
  }



  # get ml script
  sfc_script <- era5_sfc()

  # replace stuff in the script
  # DATE
  sfc_script[6] <- gsub("DATE", paste0(
    YEAR,
    "-",
    MONTH,
    "-",
    DAY
  ), sfc_script[6])

  # VARS
  sfc_script[9] <- gsub("VARS", VARS, sfc_script[9])


  # TIME
  sfc_script[11] <- gsub("TIME", TIME, sfc_script[11])


  # FORMAT
  sfc_script[13] <- gsub("FORMAT", FORMAT, sfc_script[13])


  # AREA
  sfc_script[14] <- gsub("AREA", AREA, sfc_script[14])


  # RES
  sfc_script[15] <- gsub("RES", RES, sfc_script[15])

  # FILENAME
  sfc_script[16] <- gsub("FILENAME", FILENAME, sfc_script[16])



  # write to disk
  writeLines(
    text = sfc_script,
    con = paste0(
      PATH,
      gsub(
        pattern = ".grib",
        replacement = ".py",
        FILENAME
      )
    )
  )

  message(paste0("Script for sfc data on ", DATE, " is DONE"))
}
