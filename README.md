Plot Optics
=============

This program takes the vasprun.xml file from a VASP run and extracts the real and imaginary dielectric functions and plots optical properties.

Installation
-----------

This program requires R. You can install R by following the instructions given at http://cran.r-project.org/

Usage
-----

plotoptics [-h] [-a] [-t] [-l] [-e] -- program to calculate optical properties of solids

where:
    -h  show this help text
    -a	make all plots
    -t	tauc plot
    -l	absorption plotted versus lambda
    -e	absorption plotted versus energy[eV]

notes:
    all plots are saved to .png format
    all data are saved to .dat format

