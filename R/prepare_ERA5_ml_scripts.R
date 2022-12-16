#' @title Prepare python scripts to get model level Data on daily basis from ERA5 Archive
#' @description A function to prepare python scripts to download ERA5 data,
#' mainly for WRF modelling.
#' @param DATE A character indicate on which date (e.g. "1988-08-05")
#' the data should be downloaded. default is "1988-08-05".
#' @param VARS A character of variables to be downloaded. Please refer to the ERA5 Catalogue.
#' Default is '129/130/131/132/133' which includes:
#' 129.128 is Geopotential
#' 130.128 is Temperature
#' 131.128 is U component of wind
#' 132.128 is V component of wind
#' 133.128 is Specific humidity
#' @param AREA A character of the area of interest (python list) which is specified as N, W, S, E.
#' Default is  "square-bracket 90, -180, -90, 180,square-bracket".
#' @param RES Resolution of the data to be downloaded. Default is "0.25/0.25"
#' @param FORMAT Format of the data, either grib or netcdf. Default is grib.
#' @param PATH A character pointing to where the genereted script will be saved.
#' @author Ahmed Homoudi
#' @export

prepare_ERA5_ml_scripts <- function(DATE = "1988-08-5",
                                    VARS = "129.128/130.128/131.128/132.128/133.128",
                                    AREA = "[ 90, -180, -90, 180, ]",
                                    RES = "0.25/0.25",
                                    FORMAT = "grib",
                                    PATH = "~/") {

  # extract variables from date

  YEAR <- format(as.Date(DATE), "%Y")
  MONTH <- format(as.Date(DATE), "%m")
  DAY <- format(as.Date(DATE), "%d")

  message("Downloading the daily time step from 00 to 23 by 1 hour interval")

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
      "ERA5_ML_",
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
      "ERA5_ML_",
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
  ml_script <- era5_ml()

  # replace stuff in the script
  # DATE
  ml_script[6] <- gsub("DATE", paste0(
    YEAR,
    "-",
    MONTH,
    "-",
    DAY
  ), ml_script[6])

  # VARS
  ml_script[10] <- gsub("VARS", VARS, ml_script[10])


  # TIME
  ml_script[12] <- gsub("TIME", TIME, ml_script[12])


  # FORMAT
  ml_script[14] <- gsub("FORMAT", FORMAT, ml_script[14])


  # AREA
  ml_script[15] <- gsub("AREA", AREA, ml_script[15])


  # RES
  ml_script[16] <- gsub("RES", RES, ml_script[16])

  # FILENAME
  ml_script[17] <- gsub("FILENAME", FILENAME, ml_script[17])



  # write to disk
  writeLines(
    text = ml_script,
    con = paste0(
      PATH,
      gsub(
        pattern = ".grib",
        replacement = ".py",
        FILENAME
      )
    )
  )

  message(paste0("Script for ml data on ", DATE, " is DONE"))
}
