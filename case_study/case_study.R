## $ID: case_study.R, last updated 2018/08/06, F. Osorio

# load 'images' saved in R format (to load TIF images use 'reading_TIF.R' file)
load("../data/sardinia_00.rda")
load("../data/sardinia_05.rda")
load("../data/sardinia_30.rda")
load("../data/sardinia_60.rda")

# loading dynamic library (.SO) and reading R sources
dyn.load("SSIM.so") # copy 'SSIM.so' to current working directory
source("../code/SSIM.R")
source("../code/SSIM_FIT.R")
source("../code/SSIM_TEST.R")

# coefficients estimation using model with multiplicative noise
o1 <- SSIM.fit(sardinia00, sardinia05, maxiter = 50)
o2 <- SSIM.fit(sardinia00, sardinia30, maxiter = 50)
o3 <- SSIM.fit(sardinia00, sardinia60, maxiter = 50)

# gradient statistic to test H0: alpha = beta = gamma = 1
z1 <- SSIM.test(o1)
z2 <- SSIM.test(o2)
z3 <- SSIM.test(o3)

# print results
z1
#
#Gradient test to assess the SSIM balance
#
#gradient statistic: 0 on 3 degrees of freedom, p-value: 1
#alternative hypothesis: SSIM coefficients are not equal to 1
#
#Estimated coefficients:
# [1] 1 1 1

z2
#
#Gradient test to assess the SSIM balance
#
#gradient statistic: 0 on 3 degrees of freedom, p-value: 1
#alternative hypothesis: SSIM coefficients are not equal to 1
#
#Estimated coefficients:
# [1] 1 1 1

z3
#
#Gradient test to assess the SSIM balance
#
#gradient statistic: 11382.69 on 3 degrees of freedom, p-value: 0
#alternative hypothesis: SSIM coefficients are not equal to 1
#
#Estimated coefficients:
# luminance  contrast structure
#   1.5461    1.5830    3.0169

# computing SSIM between images...
SSIM(sardinia00, sardinia05)
#$SSIM
#[1] 0.9809501
#
#$coefficients
#alpha  beta gamma
#    1     1     1
#
#$comps
#luminance  contrast structure
#1.0000000 0.9998139 0.9811327
#
#$stats
#    x.bar     x.var     y.bar     y.var       cov
# 80.95952 940.95176  80.96274 978.54376 940.90726
#
#$speed
#   user  system elapsed
#  0.042   0.004   0.045

SSIM(sardinia00, sardinia30)
#$SSIM
#[1] 0.8960606
#
#$coefficients
#alpha  beta gamma
#    1     1     1
#
#$comps
#luminance  contrast structure
#1.0000000 0.9943658 0.9011379
#
#$stats
#     x.bar      x.var      y.bar      y.var        cov
#  80.95952  940.95176   80.95543 1167.52950  941.62214
#
#$speed
#   user  system elapsed
#  0.036   0.003   0.039

cf <- o3$coefficients
SSIM(sardinia00, sardinia60, alpha = cf[1], beta = cf[2], gamma = cf[3])
#$SSIM
#[1] 0.5482978
#
#$coefficients
#   alpha     beta    gamma
#1.546107 1.582993 3.016899
#
#$comps
#luminance  contrast structure
#1.0000000 0.9816347 0.8274024
#
#$stats
#     x.bar      x.var      y.bar      y.var        cov
#  80.95952  940.95176   80.94752 1391.38843  941.67630
#
#$speed
#   user  system elapsed
#  0.019   0.002   0.022
