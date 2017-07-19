#' Finds the root dir of a project made with starUtils
#'
#' @return the root dir, defined as a folder containing
#'     ".projectInfo.RData". Throws an error if no root
#'     is found.
#' @examples
#' findKeithRoot()
#' @export
findKeithRoot <- function(){

  is_keith_project <-
    has_file_pattern(glob2rx("projectInfo.RData"))
  projectRoot <- find_root(is_keith_project)

}
