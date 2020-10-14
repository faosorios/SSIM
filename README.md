# Estimation of the Structural Similarity Index (SSIM) for Image Quality Assessment 

[![R](https://img.shields.io/badge/Made%20with-R%20under%20development-success)](https://cran.r-project.org/)
[![png](https://img.shields.io/badge/png-0.1--7-important)](https://cran.r-project.org/package=png)
[![SpatialPack](https://img.shields.io/badge/SpatialPack-0.3--8196-important)](https://cran.r-project.org/package=SpatialPack)
[![alabama](https://img.shields.io/badge/alabama-2015.3--1-red)](https://cran.r-project.org/package=alabama)
[![gmm](https://img.shields.io/badge/gmm-1.6--2-red)](https://cran.r-project.org/package=gmm)

Supplementary material to **Statistical estimation of the structural similarity index for image quality assessment** by Felipe Osorio, Ronny Vallejos, Wilson Barraza, Silvia Ojeda and Marcos A. Landi

Code written by: Felipe Osorio and Wilson Barraza

Correspondence author: Felipe Osorio, Email: felipe.osorios@usm.cl

### Code tested on:
- R under development (2018-02-21 r74285), running Linux Mint 18.3 (64 bits)
- R version 3.3.0, running OS X 10.13.4 (64 bits)

### Instructions: 
To create the Dynamically Loaded (DL) library, using the console prompt move to `/code/src` directory and enter:

`R CMD SHLIB -o SSIM.so *.c`

Next, copy `SSIM.so` file to the working directory (in our case to `/simulation`), and execute the commands in `simulation.R` and `CDF.R` files.

### CONTENTS:
- code/src/ : C sources for parameter estimation and computation of the structural similarity index for images (SSIM).
- code/SSIM.R : R function for computation of SSIM.
- code/SSIM_FIT.R : R function for parameter estimation of SSIM.
- simulation/gamma.simul.R: R function to perform the contamination with multiplicative noise using a Gamma distribution, for different decreasing levels of contamination, that is, 1, 2, 4, 8, 16, and 32 looks.
- simulation/simulation.R: R commands to perform the simulation study described at Section 3 from manuscript.
- simulation/CDF.R: R commands to computation of empirical cumulative distribution of the SSIM under H0 and H1 for several looks.
- data/ : reference images (Lena, Baboon and texmos2) used in numerical experiments (available in .RDA and .PNG formats).
- README.md : this file.
