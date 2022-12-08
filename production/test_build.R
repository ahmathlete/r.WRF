usethis::use_github_release()
library(Rmpi)
# round the change to the nearest number
# reduce space between the middle plots
devtools::document()
print("                   ***                   ")
devtools::load_all()
print("                   ***                   ")
devtools::check(args = "--no-examples",env_vars = c(NOT_CRAN = "false"))
print("                   ***                   ")
styler::style_pkg()
# building ----------------------------------------------------------------

devtools::build_manual()
devtools::build()
devtools::build(binary = T)
devtools::build_site()

# checking ----------------------------------------------------------------
devtools::check_built("/media/ahmed/Daten/WHK2/R.2.0/KlimaKonformC3_2.0.0.tar.gz")
devtools::check_man()


# installing --------------------------------------------------------------
devtools::install(upgrade = F)
usethis::use_vignette(name = "todo_list")

# to do list --------------------------------------------------------------

# use mask from terra to remove unwanted classes

# add a logo
# add badges
![GitHub commits since tagged version](https://img.shields.io/github/commits-since/ahmathlete/KlimaKonformC3/v2.0.0?style=plastic)
usethis::use_badge(
  badge_name = "License: GPL v3.0",
  src = "https://img.shields.io/badge/License-GPL%20v3-blue.svg",
  href = "http://www.gnu.org/licenses/gpl-3.0"
)
# let github make the action check
usethis::use_github_action_check_standard()

#https://shields.io/
ahmathlete KlimaKonformC3
#[![repo status - closed](https://img.shields.io/badge/repo_status-closed-ff0000)](https://)
# R  ----------------------------------------------------------------------
# utilities
print("                   ***                   ")
usethis::use_r("prepare_ERA5_ml_scripts")
print("                   ***                   ")
usethis::use_data_raw("standard_output_en")
print("                   ***                   ")
usethis::use_package("magick")
print("                   ***                   ")

styler::style_pkg()
# inst --------------------------------------------------------------------
library(ecmwfr)
install.packages("ecmwfr", lib = "/home/h7/ahho623a/R-Packages")
#https://vsoch.github.io/2013/install-r-packages-that-require-compilation-on-linux-without-sudo/
install.packages('unixtools', lib = "/home/h7/ahho623a/R-Packages",repos="https://rforge.net")
library('unixtools')
set.tempdir('/path/to/folder')
tempdir()
.libPaths( c( .libPaths(), "/home/h7/ahho623a/R-Packages") )
# RMPI --------------------------------------------------------------------

library(Rmpi)

# initialize an Rmpi environment
ns <- mpi.universe.size()
mpi.spawn.Rslaves(nslaves=ns)

# send these commands to the slaves
mpi.bcast.cmd( id <- mpi.comm.rank() )
mpi.bcast.cmd( ns <- mpi.comm.size() )
mpi.bcast.cmd( host <- mpi.get.processor.name() )

# all slaves execute this command
mpi.remote.exec(paste("I am", id, "of", ns, "running on", host))

# close down the Rmpi environment
mpi.close.Rslaves(dellog = FALSE)
mpi.exit()

35,10
62.3,32.3

i<-4
a <- wrftools::wrf_domains(max_dom = 3,
                           map_proj = "mercator",
                           ref_lat = 22.5,
                           ref_lon = 45.5,
                           truelat1 = 22.5,
                           i_parent_start =c(1, c(220,280)*i),
                           j_parent_start = c(1, c(200,215)*i),
                           e_we = c(1000,1801,3001)*i,
                           e_sn = c(1000,1801,3001)*i*0.75,
                           parent_id = c(1,1,2),
                           parent_grid_ratio = c(1,3,3),
                           dx = 3000,
                           dy = 3000,
                           dtm = (102.42*1000))
a[[1]]

usethis::use_logo(img = "../r.WRF_logo/r.WRF_logo.png")


# WRF domain --------------------------------------------------------------

wrftools::wrf_domains(
  max_dom = 3,
  map_proj = "mercator",
  ref_lat = 23,
  ref_lon = 47,
  truelat1 = 23,
  parent_id = c(1, 1, 2),
  parent_grid_ratio = c(1, 3, 3),
  i_parent_start = c(1, 781, 1451),
  j_parent_start = c(1, 601, 1301),
  e_we = c(3501, 6001, 8701),
  e_sn = c(2901, 5173, 8701),
  dx = 3000,
  dy = 3000,
  dtm = (102.42 * 1000)
)

