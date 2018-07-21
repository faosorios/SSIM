## $ID: SSIM.R 2018/05/12 14:04:07, F. Osorio

## structural similarity index for images (SSIM)

# arguments:
# x,y                 nrow-by-ncol images to be compared
# alpha,beta,gamma    SSIM coefficients
# eps                 small constants

SSIM <- function(x, y, alpha = 1, beta = 1, gamma = 1, eps = c(0.01, 0.03, 0.03))
{
  # rescaling constants
  eps[1] <- (255 * eps[1])^2
  eps[2] <- (255 * eps[2])^2
  eps[3] <- .5 * (255 * eps[3])^2

  # coefficients of SSIM
  pars <- c(alpha, beta, gamma)

  if (all(dim(x)) != all(dim(y)))
    stop("x and y images must have same dimensions.")

  nobs <- prod(dim(x))
  eps  <- c(nobs, eps)
  now  <- proc.time()

  # calling C function
  z <- .C("SSIM",
          x = as.double(x),
          y = as.double(y),
          pars = as.double(pars),
          eps = as.double(eps),
          stats = double(5),
          comps = double(4))
  stats <- z$stats[c(1,3,2,4,5)]
  comps <- z$comps[2:4]
  ssim  <- z$comps[1]

  # output object
  speed <- proc.time() - now
  names(pars)  <- c("alpha", "beta", "gamma")
  names(stats) <- c("x.bar", "x.var", "y.bar", "y.var", "cov")
  names(comps) <- c("luminance", "contrast", "structure")
  o <- list(SSIM = ssim, coefficients = pars, comps = comps, stats = stats,
            speed = speed)
  o
}
