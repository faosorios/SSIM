# read PNG images
library(png)
mississippi <- readPNG("mississippi.png")
dam <- readPNG("dam.png")
copeland <- readPNG("copeland.png")
corpus <- readPNG("corpus_christi.png")

# load SpatialPack, shared objects and read source files
library(SpatialPack)
dyn.load("SSIM.so")
source("../code/SSIM_FIT.R")
source("../code/SSIM_TEST.R")
source("SSIM_img.R")

# fit heteroscedastic nonlinear regression model for each image
copeland.fit <- SSIM.img(copeland)
copeland.fit
#$results
#            alpha     beta    gamma iter     stat p-value logLik.H0 logLik.H1   SSIM.H0   SSIM.H1
#Lee      1.891141 1.932285 3.135988    6 327703.7       0  84654.27 -761.1202 0.6800042 0.3255148
#enhanced 1.690552 1.721994 2.986952    4 486337.1       0  74423.24 7111.1827 0.6522258 0.3062420
#Kuan     1.690555 1.721996 2.986957    4 486339.4       0  74423.70 7111.3985 0.6522183 0.3062342
#
#$speed
#   user  system elapsed
# 59.896   0.553  60.448

corpus.fit <- SSIM.img(corpus)
corpus.fit
#$results
#            alpha     beta    gamma iter     stat p-value logLik.H0  logLik.H1   SSIM.H0   SSIM.H1
#Lee      1.610080 1.638734 2.704624    8 194104.1       0  57189.08 -3989.7528 0.8281667 0.6143736
#enhanced 1.600024 1.625771 2.511700    3 237254.4       0  53056.54   122.2126 0.8178605 0.6152269
#Kuan     1.600024 1.625771 2.511700    3 237254.4       0  53056.54   122.2126 0.8178605 0.6152269
#
#$speed
#   user  system elapsed
# 60.194   0.483  60.676

dam.fit <- SSIM.img(dam)
dam.fit
#$results
#         alpha beta gamma iter         stat p-value logLik.H0 logLik.H1   SSIM.H0   SSIM.H1
#Lee          1    1     1    2 1.050536e-13       1 -11475.09 -11475.09 0.9997174 0.9997174
#enhanced     1    1     1    2 2.841198e-13       1 -11477.30 -11477.32 0.9997117 0.9997117
#Kuan         1    1     1    2 2.841198e-13       1 -11477.30 -11477.32 0.9997117 0.9997117
#
#$speed
#   user  system elapsed
#  7.522   0.021   7.544

mississippi.fit <- SSIM.img(mississippi)
mississippi.fit
#$results
#            alpha     beta    gamma iter     stat p-value logLik.H0  logLik.H1   SSIM.H0   SSIM.H1
#Lee      1.587887 1.618998 2.662694    9 239731.7       0  75408.28 -13819.815 0.8896002 0.7402853
#enhanced 1.463710 1.485825 2.452519    4 275109.5       0  63456.08  -8408.959 0.8835353 0.7456659
#Kuan     1.463710 1.485825 2.452519    4 275109.5       0  63456.08  -8408.959 0.8835353 0.7456659
#
#$speed
#   user  system elapsed
#100.980   0.788 101.767
