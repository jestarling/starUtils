#' Build a new Project Description from a Template
#'
#' This pulls in a template description skeleton from
#' the package. There should just be one project description,
#' and it should reside at the top level of the project.
#' It should describe why we're undertaking this in broad
#' terms.
#' This is largely a wrapper for
#' rmarkdown::draft() with some prespecified arguments.
#' @param folder name of the folder, in quotes, including backslash at end.
#'
#' @return invisible if the report subfolder and skeleton
#'     are successfully built.
#' @examples
#' newProjectDescription()
#' newProjectDescription('ProjectInfo/')
#' @export
newProjectDescription <- function(folder=NULL){

  rmarkdown::draft(file = paste(folder,"projectDescription.Rmd",sep=''),
                   template = "projectDescription",
                   package = "starUtils",
                   create_dir = FALSE,
                   edit = FALSE)

}

# ORIGINAL FUNCTION:
# newProjectDescription <- function(){
#    
#    rmarkdown::draft(file = "projectDescription.Rmd",
#                     template = "projectDescription",
#                     package = "starUtils",
#                     create_dir = FALSE,
#                     edit = FALSE)
#    
# }
