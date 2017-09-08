#' Helper script for setting up a new project.
#'
#' This is a script which is used for setting up a new project and calling
#' the functions in this package.  Parameters for each function can be modified
#' as described in documentation.
#' 
#' The steps to using this script will be described in a vignette, but are presented
#' here for easy use.
#' 
#' Step 1: Create a new directory to store your project on your local machine.
#' 
#' Step 2: Create a new RStudio project in your project folder.
#' 
#' Step 3: Copy this _newproject.R file into the project folder.
#' 
#' Step 4: Open the _newproject.R file and execute.

# Install package.
library(devtools)
install_github('jestarling/starUtils')

# Load package.
library(starUtils)

# Verify root is correct.
find_root(is_rstudio_project)

# Create project directories.
setUpProject(folderStyle="JenniferStarling",projectDescriptionFolder='ProjectInfo/', python=TRUE)

# Preview contents of project directory.
dir()

# Add .gitkeep files to all directories so git does not drop empty directories.
x = sprintf('find . -type d -empty -not -path "./.git/*" -exec touch {}/.gitkeep \\;')
system(x)
