#fedora-live-astronomy-kde.ks
# With KDE Desktop

# Fedora Astronomy: For astronomers and astrophysicists
# Fedora-Astronomy aims to create a Fedora which has the generic
# toolset for the astronomer
#
# Web: https://fedoraproject.org/wiki/SIGs/Astronomy/AstroSpin
#
# Partly based on Scientific KDE Spin 
#     https://fedoraproject.org/wiki/Scientific_Spin
#

# Maintainer: Christian Dersch <lupinix@fedoraproject.org>
#             https://fedoraproject.org/wiki/User:Lupinix
# Co-Maintainer: JT Pennington <q5sys@fedoraproject.org>
#             https://fedoraproject.org/wiki/User:q5sys

%include fedora-live-kde-base.ks
%include fedora-live-minimization.ks

# The recommended part size for DVDs is too close to use for the astronomy spin
part / --size 16000

%packages

# Installing the default/mandatory packages from engineering & scientific
@engineering-and-scientific

# Basic development
@development-tools
@c-development

# astronomical data analysis
astrometry
astrometry-tycho2
cdsclient
cfitsio-utils
psfex
scamp
sextractor
#siril
skyviewer
swarp
wcstools

# Observatory: KStars + INDI drivers
indi-3rdparty-drivers
indistarter
kstars

# misc. astronomy
#celestia
stellarium
#virtualplanet

# Some astro environment stuff
astronomy-menus
astronomy-menus-toplevel

#python 3 and tools/libraries not included from the groups
python3
python3-tools
python3-matplotlib
python3-scipy
python3-numpy
python3-ipython
python3-ipython-console
python3-ipython-notebook
python3-sympy
python3-networkx
python3-pandas
python3-pillow
python3-seaborn
python3-statsmodels
python3-scikit-learn
python3-scikit-image
# Python 3 astronomy
astropy-tools
ginga
python3-astropy
python3-astroML
python3-astroquery
python3-astroscrappy
python3-APLpy
python3-ATpy
python3-ccdproc
python3-fitsio
python3-gatspy
python3-photutils
python3-pyvo
python3-reproject
python3-sep

# matplotlib backends
python3-matplotlib-qt5
python3-matplotlib-tk


# Python IDE very useful for scientific use
# FTI with Python 3.12:
# https://bugzilla.redhat.com/show_bug.cgi?id=2220598
# can be restored when that is fixed
#python3-spyder

# BOINC for distributed computing
boinc-client
boinc-manager

#Version control- a GUI for each as well
git
git-gui

#Drawing, Picture viewing tools, Visualization tools
dia
gimp
kst
kst-docs
kst-fits
# LabPlot currently not installable due to #2044284
#LabPlot

#Misc. Utils
ImageMagick
kate
kate-plugins
rlwrap
screen

# Java JRE for VO tools
java

# Omit KDE 4 translations for now: https://bugzilla.redhat.com/show_bug.cgi?id=1197940
-kde-l10n-*
-calligra-l10n-*

%end

%post

%end
