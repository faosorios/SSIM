Supplementary material to **Estimation of the structural similarity index for remote sensing data** by Felipe Osorio, Ronny Vallejos, Wilson Barraza, Silvia Ojeda and Marcos A. Landi

Code written by: Felipe Osorio and Wilson Barraza

Correspondence author: Felipe Osorio, Email: felipe.osorios@usm.cl

### Code tested on:
- R under development (2018-02-21 r74285), running Linux Mint 18.3 (64 bits)
- R version 3.3.0, running OS X 10.13.4 (64 bits)

### Installation instructions: 
To create the Dynamically Loaded (DL) library, enter at the console prompt

`R CMD SHLIB -o SSIM.so *.c` or `Rcmd SHLIB -o SSIM.dll *.c` if your are in Windows

### CONTENTS:
- code/src/ : C sources for parameter estimation and computation of the structural similarity index for images (SSIM).
- code/SSIM.R : R function for computation of SSIM.
- code/SSIM_FIT.R : R function for parameter estimation of SSIM.
- data/ : images used in numerical experiments (available in .RDA and .TIF formats).
- SSIM_suppl.pdf : Supplementary material cited by the manuscript.
- README.md : this file.
