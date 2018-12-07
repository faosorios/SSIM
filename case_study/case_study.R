## $ID: case_study.R, last updated 2018/12/07, F. Osorio

# load 'images' saved in R format (to load TIF images use 'reading_TIF.R' file)
load("../data/synthetic00.rda")
load("../data/synthetic10.rda")
load("../data/synthetic15.rda")
load("../data/synthetic1R.rda")
load("../data/synthetic40.rda")
load("../data/synthetic45.rda")
load("../data/synthetic4R.rda")
load("../data/synthetic80.rda")
load("../data/synthetic85.rda")
load("../data/synthetic8R.rda")

# loading dynamic library (.SO) and reading R sources
dyn.load("SSIM.so") # copy 'SSIM.so' to current working directory
source("../code/SSIM.R")
source("../code/SSIM_FIT.R")
source("../code/SSIM_TEST.R")

# coefficients estimation using model with multiplicative noise
o10 <- SSIM.fit(synthetic00, synthetic10, maxiter = 50)
o15 <- SSIM.fit(synthetic00, synthetic15, maxiter = 50)
o1R <- SSIM.fit(synthetic00, synthetic1R, maxiter = 50)
o40 <- SSIM.fit(synthetic00, synthetic40, maxiter = 50)
o45 <- SSIM.fit(synthetic00, synthetic45, maxiter = 50)
o4R <- SSIM.fit(synthetic00, synthetic4R, maxiter = 50)
o80 <- SSIM.fit(synthetic00, synthetic80, maxiter = 50)
o85 <- SSIM.fit(synthetic00, synthetic85, maxiter = 50)
o8R <- SSIM.fit(synthetic00, synthetic8R, maxiter = 50)

# gradient statistic to test H0: alpha = beta = gamma = 1
z10 <- SSIM.test(o10)
z15 <- SSIM.test(o15)
z1R <- SSIM.test(o1R)
z40 <- SSIM.test(o40)
z45 <- SSIM.test(o45)
z4R <- SSIM.test(o4R)
z80 <- SSIM.test(o80)
z85 <- SSIM.test(o85)
z8R <- SSIM.test(o8R)

# print results
z10
#
#Gradient test to assess the SSIM balance
#
#gradient statistic: 0 on 3 degrees of freedom, p-value: 1
#alternative hypothesis: SSIM coefficients are not equal to 1
#
#Estimated coefficients:
# luminance  contrast structure
#        1         1         1

z15
#
#Gradient test to assess the SSIM balance
#
#gradient statistic: 16864.08 on 3 degrees of freedom, p-value: 0
#alternative hypothesis: SSIM coefficients are not equal to 1
#
#Estimated coefficients:
# luminance  contrast structure
#   1.8122    1.9421    1.7545

z1R
#
#Gradient test to assess the SSIM balance
#
#gradient statistic: 22829.35 on 3 degrees of freedom, p-value: 0
#alternative hypothesis: SSIM coefficients are not equal to 1
#
#Estimated coefficients:
# luminance  contrast structure
#   1.5154    1.6268    1.4777

# computing SSIM between images...
SSIM(synthetic00, synthetic10)
#$SSIM
#[1] 0.4380722
#
#$coefficients
#alpha  beta gamma
#    1     1     1
#
#$comps
#luminance  contrast structure
#0.9631268 0.9806823 0.4638034
#
#$stats
#    x.bar     x.var     y.bar     y.var       cov
# 144.3057 5458.5072  109.5157 8120.2790 3072.1613
#
#$speed
#   user  system elapsed
#  0.007   0.000   0.007

cf <- o15$coefficients
SSIM(synthetic00, synthetic15, alpha = cf[1], beta = cf[2], gamma = cf[3])
#$SSIM
#[1] 0.6099715
#
#$coefficients
#   alpha     beta    gamma
#1.812227 1.942140 1.754460
#
#$comps
#luminance  contrast structure
#0.9629403 0.8829161 0.9004051
#
#$stats
#    x.bar     x.var     y.bar     y.var       cov
# 144.3057 5458.5072  109.4370 1961.6577 2943.4504
#
#$speed
#   user  system elapsed
#  0.004   0.004   0.008

cf <- o1R$coefficients
SSIM(synthetic00, synthetic1R, alpha = cf[1], beta = cf[2], gamma = cf[3])
#$SSIM
#[1] 0.6310757
#
#$coefficients
#   alpha     beta    gamma
#1.515379 1.626786 1.477679
#
#$comps
#luminance  contrast structure
#0.9588597 0.9058664 0.8524846
#
#$stats
#    x.bar     x.var     y.bar     y.var       cov
# 144.3057 5458.5072  107.7707 2202.0274 2951.2099
#
#$speed
#   user  system elapsed
#  0.012   0.000   0.011
