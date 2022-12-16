era5_ml <- function() {
  readLines(system.file("scripts/era5_ml.py", package = "r.WRF"))
}

era5_sfc <- function() {
  readLines(system.file("scripts/era5_sfc.py", package = "r.WRF"))
}

era5_slurm <- function() {
  readLines(system.file("scripts/era5_slurm.sh", package = "r.WRF"))
}

