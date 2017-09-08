#!/usr/bin/env python

#==========================================================
# TITLE:    JE Starling
# PURPOSE:  Basic analysis setup for a new file.
# AUTHOR:   JE Starling
# DATE:     8 Sept 2017
#==========================================================

# Clean workspace (-f is without user confirmation).
%reset -f

#==========================================================
#===   Load libraries   ===================================
#==========================================================

import sys
import math as m  
import numpy as np
import pandas as pd
import scipy as sp
import matplotlib as plt  # For plotting.
import pylab as pylab     # For saving jpg images.

#==========================================================
#===   Set up workspace   =================================
#==========================================================

# Set working directory.
import os
from os import path
os.chdir("/Users/jennstarling/Stats/Projects/learnPython/BasicSetup")
root = os.getcwd()

# Set data source path.
data_path = os.path.join(root,'Data')

# Create output directory paths.
out_figs = os.path.join(root, 'Figs/')

#==========================================================
#===   Read in data   =====================================
#==========================================================

df = load(os.path.join(data_path,'surveydata.csv',delimiter=';'))
