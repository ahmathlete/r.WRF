usethis::use_github_release()
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

print("                   ***                   ")
usethis::use_r("clima_diagramm_4corners")
print("                   ***                   ")
usethis::use_data_raw("standard_output_en")
print("                   ***                   ")
usethis::use_package("magick")
print("                   ***                   ")

# inst --------------------------------------------------------------------

usethis::read


# others ------------------------------------------------------------------
library(readr)
X2ter_lauf <- read_csv("~/CloudStore/Nextcloud/Shared/KlimaKonform-Results/info_simulations/2ter_lauf.csv")

X2ter_lauf$minimum<-X2ter_lauf$maximum<-NULL

colnames(X2ter_lauf)<-c("sim_id","variable","GCM","RCM", "rcp",
                        "ensemble", "version", "start", "end","minimum","maximum")
data.table::fwrite(X2ter_lauf %>%
                     dplyr::mutate_if(is.numeric, round, digits = 3),
                   "~/CloudStore/Nextcloud/Shared/KlimaKonform-Results/info_simulations/2ter_lauf.csv")

rm(X2ter_lauf)

X3ter_lauf <- read_csv("~/CloudStore/Nextcloud/Shared/KlimaKonform-Results/info_simulations/3ter_lauf.csv")

data.table::fwrite(X3ter_lauf %>%
                     dplyr::mutate_if(is.numeric, round, digits = 3),
                   "~/CloudStore/Nextcloud/Shared/KlimaKonform-Results/info_simulations/3ter_lauf.csv")


X4ter_lauf <- read_csv("~/CloudStore/Nextcloud/Shared/KlimaKonform-Results/info_simulations/4ter_lauf.csv")

colnames(X4ter_lauf)<-c("sim_id","variable","GCM","RCM", "rcp",
                        "ensemble", "version", "start", "end","minimum","maximum")

data.table::fwrite(X4ter_lauf %>%
                     dplyr::mutate_if(is.numeric, round, digits = 3),
                   "~/CloudStore/Nextcloud/Shared/KlimaKonform-Results/info_simulations/4ter_lauf.csv")


# find . -iname '*SpTr*'  -exec cp --parents {}  ../test \;

#lubridate
usethis::use_r("sim_linear_trend")
usethis::use_package("ggridges")
usethis::use_data_raw("standard_output_en")
usethis::edit_r_environ()

usethis::use_description()
usethis::use_spell_check(vignettes = TRUE, lang = "en-GB", error = FALSE)
load("R/sysdata.rda")
# only one
usethis::use_gpl3_license()
usethis::use_readme_md()
usethis::use_lic("stable")

devtools::install_github("GuangchuangYu/badger")

badger::badge_code_size()

