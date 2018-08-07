## $ID: reading_TIF.R, last updated 2018/08/06, F. Osorio

# to load images in TIF format
library(tiff)
sardinia00 <- readTIFF("../data/sardinia00.tif")
sardinia05 <- readTIFF("../data/sardinia05.tif")
sardinia30 <- readTIFF("../data/sardinia30.tif")
sardinia60 <- readTIFF("../data/sardinia60.tif")

# scaling images to be in the interval [0,255]
sardinia00 <- round(255 * sardinia00)
sardinia05 <- round(255 * sardinia05)
sardinia30 <- round(255 * sardinia30)
sardinia60 <- round(255 * sardinia60)

# rotating to natural order when plotted with 'image'
rows <- 1:810
cols <- 1:1098
sardinia00 <- t(sardinia00[rev(rows),cols])
sardinia05 <- t(sardinia05[rev(rows),cols])
sardinia30 <- t(sardinia30[rev(rows),cols])
sardinia60 <- t(sardinia60[rev(rows),cols])

# plotting in grayscale (lengthy operation)
image(sardinia00, col = gray((0:32)/32), axes = FALSE)
image(sardinia05, col = gray((0:32)/32), axes = FALSE)
image(sardinia30, col = gray((0:32)/32), axes = FALSE)
image(sardinia60, col = gray((0:32)/32), axes = FALSE)
