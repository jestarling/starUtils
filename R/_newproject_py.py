#!/usr/bin/python

#===============================================================
# User Inputs
#===============================================================

# Set path of directory for root of project.
myPath = '/Users/jennstarling/Stats/Projects/learnPython/TestProject'


#===============================================================
# Set up new folders.
#===============================================================

# Sets up file system in directory where this file is located.
import os
os.chdir(myPath)
os.getcwd()

# Set up new folders. 

newFolders = ['Data/', 'DataRaw/', 
              'FromCollaborator/',
              'Py/','Py/Cache/','Py/Output/','Py/Figs/','Py/Reports', 'Py/Tables/',
              'Paper/','Paper/Inputs/','Paper/Proofs/',
              'Paper/Final/', 'Paper/Submitted/',
              'Reference/', 'Notes/', 'ProjectInfo/'
              ]   

for i in range(0,len(newFolders)):
    os.makedirs(os.path.join(myPath,newFolders[i]))         

# Add .gitkeep files to all directories so git does not drop empty directories.
x = 'find . -type d -empty -not -path "./.git/*" -exec touch {}/.gitkeep \;'
os.system(x)

# Copy the _new_py_script.py file to the Py/ folder.
from shutil import copyfile
src = '/Users/jennstarling/Stats/Projects/starUtils/R/_py_new_script.py'
dst = os.path.join(myPath,'Py/_py_new_script.py')
copyfile(src, dst)



