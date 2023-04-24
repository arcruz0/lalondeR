#' Analyze a vector (by adding white noise!)
#'
#' This function analyzes a numeric vector. If `training = TRUE` (the default), the function adds random noise Z, with
#' \eqn{Z \sim Uniform(-1, 1)}.
#'
#' @return A numeric vector that has been analyzed.
#' @export
#'
#' @examples
#' x <- 1:10
#'
#' # Analyze a vector without added noise (boring)
#' y1 <- AnalysisFunction(x, training = F)
#' plot(x, y1) # no noise
#'
#' # Analyze a vector with added noise (fun)
#' y2 <- AnalysisFunction(x, training = T)
#' plot(x, y2) # added noise
#'
#' @export
#'
#' @md

AnalysisFunction <- function(x, training = T) {

  if (!is.numeric(x)){stop("x must be numeric!")} # an error msg

  if (training){
    return(x + runif(n = length(x), min = -1, max = 1))
  } else {
    return(x)
  }

}
