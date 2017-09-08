#' Autopopulates project folder with common directories
#'
#' I almost always start a project by creating subdirectories
#' for RawData, ProcessedData, and so on, so I decided to
#' script the process to improve consistency.
#'
#' @param folderStyle character string naming the person
#'     whose file structure I'm using as a template.
#'     Default is "JenniferStarling"; other currently allowed
#'     variants are "KeithBaggerly", JennyBryan", and "KarlBroman".
#' @param includeProjectDescription logical - should a
#'     skeleton project description file be included at
#'     the top level of the project hierarchy? Defaults
#'     to TRUE.
#' @return invisible if all of the folders were successfully
#'     created.
#' @examples
#' setupProject("JenniferStarling")
#' @export
setUpProject <- function(folderStyle="JenniferStarling",
                         includeProjectDescription=TRUE, projectDescriptionFolder=NULL, python=FALSE){

  ## identify project root directory

  tempFolder <-
    tryCatch(find_root(is_rstudio_project),
             error = function(e) e)
  if(length(grep("No root directory found", tempFolder) == 0)){
    cat(paste0("No rstudio project found\n",
               "Setting working directory as project root\n"))
    projectRoot <- getwd()
  }else{
    cat("Setting project root")
    projectRoot <- tempFolder
  }

  projectInfo <- vector("list", 6)
  names(projectInfo) <-
    c("folderStyle",
      "figureFolder",
      "reportsFolder",
      "rawDataFolder",
      "processedDataFolder",
      "outputFolder")

  # Starling folder style.
  if(folderStyle=="JenniferStarling"){
     
     ## Jennifer Starling folder style.
     
     c("fromCollaborator", "data", "code", "figs",
       "results", "prose", "rmd", "web")
     
     if(python==FALSE){
         foldersToAdd <- c('Data','DataRaw','FromCollaborator',
                       'R','R/Cache','R/Output','R/Figs','R/Reports','R/Tables',
                       'Paper','Paper/Inputs','Paper/Proofs','Paper/Final',
                       'Paper/Reviews','Paper/Proofs','Paper/Submitted',
                       'Reference','Notes','ProjectInfo')
     
         projectInfo$folderStyle <- folderStyle
         projectInfo$figureFolder <- "R/Figs"
         projectInfo$reportsFolder <- "R/Reports"
         projectInfo$rawDataFolder <- "DataRaw"
         projectInfo$processedDataFolder <- "Data"
         projectInfo$outputFolder <- "R/Output"
     }
     if(python==TRUE){
        
        foldersToAdd <- c('Data','DataRaw','FromCollaborator',
                          'Py','Py/Cache','Py/Output','Py/Figs','Py/Reports','Py/Tables',
                          'Paper','Paper/Inputs','Paper/Proofs','Paper/Final',
                          'Paper/Reviews','Paper/Proofs','Paper/Submitted',
                          'Reference','Notes','ProjectInfo')
        projectInfo$folderStyle <- folderStyle
        projectInfo$figureFolder <- "Py/Figs"
        projectInfo$reportsFolder <- "Py/Reports"
        projectInfo$rawDataFolder <- "DataRaw"
        projectInfo$processedDataFolder <- "Data"
        projectInfo$outputFolder <- "Py/Output"
        
        }
     
 
     
  }
  
  # Keith Baggerly folder style.
  if(folderStyle=="KeithBaggerly"){
    foldersToAdd <-
      c("Data", "ProcessedData", "Figures", "Reports", "Output")

    projectInfo$folderStyle <- folderStyle
    projectInfo$figureFolder <- "Figures"
    projectInfo$reportsFolder <- "Reports"
    projectInfo$rawDataFolder <- "Data"
    projectInfo$processedDataFolder <- "ProcessedData"
    projectInfo$outputFolder <- "Output"
  }

   #Jenny Bryan folder style.
  if(folderStyle=="JennyBryan"){

    ## Taken from
    ## https://www.stat.ubc.ca/~jenny/
    ##   STAT545A/block19_codeFormattingOrganization.html

    foldersToAdd <-
      c("fromCollaborator", "data", "code", "figs",
        "results", "prose", "rmd", "web")

    projectInfo$folderStyle <- folderStyle
    projectInfo$figureFolder <- "figs"
    projectInfo$reportsFolder <- "rmd"
    projectInfo$rawDataFolder <- "data"
    projectInfo$processedDataFolder <- "data"
    projectInfo$outputFolder <- "results"

  }

  #Karl Broman folder style.
  if(folderStyle=="KarlBroman"){

    ## Taken from
    ## http://kbroman.org/Tools4RR/assets/
    ##   lectures/06_org_eda_withnotes.pdf
    ## Slide 6 deals with projects; he organizes
    ## folders for Papers and Presentations differently

    foldersToAdd <-
      c("Data", "Notes", "R", "R/Figs", "R/Cache",
        "RawData", "Refs")

    projectInfo$folderStyle <- folderStyle
    projectInfo$figureFolder <- "R/Figs"
    projectInfo$reportsFolder <- "R"
    projectInfo$rawDataFolder <- "RawData"
    projectInfo$processedDataFolder <- "Data"
    projectInfo$outputFolder <- "R"

  }


  for(i1 in 1:length(foldersToAdd)){
    if(!dir.exists(foldersToAdd[i1])){
      dir.create(foldersToAdd[i1])
    }
  }

  if(includeProjectDescription){

    newProjectDescription(folder=projectDescriptionFolder)

  }

  save(projectInfo,
       file=file.path(projectDescriptionFolder, "projectInfo.RData"))

}
