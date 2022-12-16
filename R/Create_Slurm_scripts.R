#' @title Create a Slurm parallel job to download ERA5
#' @description A function to list all python scripts to download ERA5 and create a slurm
#' batch file.
#' @param py.PATH Path to the created Python scripts
#' @param mem_per_cpu Memory per CPU in MB.
#' @param time_limit Time limit for the complete Slurm job. For 12 hours should be:
#' "12:00:00" and for 2 days either "48:00:00" or "2-00:00:00"
#' @param job_name The name of the job
#' @param email  The user email as \email{"user@example.com"}
#' @return  Slurm job script
#' @author Ahmed Homoudi
#' @export
#'
Create_Slurm_scripts<-function(py.PATH,
                               mem_per_cpu = 2000,
                               time_limit = "48:00:00",
                               job_name= "ERA5 for WRF",
                               email){


  py.scripts<-list.files(path = py.PATH,
                         pattern = ".py$")

  stopifnot("It seems there are no python scripts in the py.PATH"= length(py.scripts)!=0)

  message(paste0("Found ",
                 length(py.scripts),
                 " Python scripts"))

  # get example slurm
  slurm<-era5_slurm()

  # X.TIME
  slurm[5] <- gsub("X.TIME", time_limit, slurm[5])

  # X.TASK
  slurm[6] <- gsub("X.TASK", length(py.scripts), slurm[6])

  # X.MEM
  slurm[9] <- gsub("X.MEM", mem_per_cpu, slurm[9])

  # X.JOB
  slurm[10] <- gsub("X.JOB", job_name, slurm[10])


  # X.EMAIL
  slurm[11] <- gsub("X.EMAIL", email, slurm[11])

  # obtain job submitting line
  line_to_change<- grep(pattern = "srun --exclusive --ntasks=1 python3 script.py &",x = slurm)

  # lines to add according tot the number of ml scripts
  lines_to_add<- paste0("srun --exclusive --ntasks=1 python3 ",py.scripts," &")

  # NEW slurm script
  new_slurm_ml<-c(slurm[1:c(line_to_change-2)],
                  c(rbind(rep("sleep 5"),lines_to_add)),
                  slurm[c(line_to_change+1):length(slurm)])

  # write
  writeLines(new_slurm_ml, con = paste0(py.PATH,
                                        gsub(" ", "_", job_name),
                                        "_slurm.sh"))


  message(paste0("The Slurm script is produced, please check if you want to add e.g., \n ",
                 " Working directory or modules loading"))


}
