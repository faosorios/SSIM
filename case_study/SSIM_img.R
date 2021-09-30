## Id: SSIM_img.R, last updated 2020/07/06, F.Osorio

SSIM.img <- function(img, looks = 1, L = 255)
{ # function to perform to SSIM estimation and testing
  res <- matrix(0, nrow = 3, ncol = 10)
  now <- proc.time()

  # denoising with 'Lee' filter
  img2 <- denoise(img, type = "Lee", looks = looks)

  # denoising with 'enhanced Lee' filter
  img3 <- denoise(img, type = "enhanced", looks = looks)

  # denoising with 'Kuan' filter
  img4 <- denoise(img, type = "Kuan", looks = looks)

  # image in [0,255]
  img0 <- round(L * img)

  # SSIM coefficients estimation (Lee filter) ##################################
  imgR <- round(L * img2)
  fm <- SSIM.fit(img0, imgR, maxiter = 50)
  cf <- fm$coefficients
  res[1,1:3] <- cf
  res[1,4] <- fm$iterations
  z <- SSIM.test(fm)
  res[1,5] <- z$stat
  res[1,6] <- z$p.value
  res[1,7] <- fm$logLik
  res[1,8] <- z$logLik
  res[1,9] <- SSIM(img, img2, eps = c(0,0))$SSIM
  res[1,10] <- SSIM(img, img2, alpha = cf[1], beta = cf[2], gamma = cf[3], eps = c(0,0))$SSIM

  # SSIM coefficients estimation (enhanced Lee filter) #########################
  imgR <- round(L * img3)
  fm <- SSIM.fit(img0, imgR, maxiter = 50)
  cf <- fm$coefficients
  res[2,1:3] <- cf
  res[2,4] <- fm$iterations
  z <- SSIM.test(fm)
  res[2,5] <- z$stat
  res[2,6] <- z$p.value
  res[2,7] <- fm$logLik
  res[2,8] <- z$logLik
  res[2,9] <- SSIM(img, img3, eps = c(0,0))$SSIM
  res[2,10] <- SSIM(img, img3, alpha = cf[1], beta = cf[2], gamma = cf[3], eps = c(0,0))$SSIM

  # SSIM coefficients estimation (Kuan filter) #################################
  imgR <- round(L * img4)
  fm <- SSIM.fit(img0, imgR, maxiter = 50)
  cf <- fm$coefficients
  res[3,1:3] <- cf
  res[3,4] <- fm$iterations
  z <- SSIM.test(fm)
  res[3,5] <- z$stat
  res[3,6] <- z$p.value
  res[3,7] <- fm$logLik
  res[3,8] <- z$logLik
  res[3,9] <- SSIM(img, img4, eps = c(0,0))$SSIM
  res[3,10] <- SSIM(img, img4, alpha = cf[1], beta = cf[2], gamma = cf[3], eps = c(0,0))$SSIM

  speed <- proc.time() - now

  colnames(res) <- c("alpha","beta","gamma","iter","stat","p-value","logLik.H0","logLik.H1","SSIM.H0","SSIM.H1")
  rownames(res) <- c("Lee","enhanced","Kuan")

  out <- list(results = res, speed = speed)
  out
}
