#' Download Lalonde's data from Dropbox
#'
#' This function downloads Lalonde's NSW data from Dropbox, outputting it as `data.frame` object.
#'
#' @usage
#' GetDataAsset()
#'
#' @return A data frame with Lalonde's NSW data (614 rows and 10 columns):
#' \describe{
#'   \item{treat}{Treatment assignment (dummy)}
#'   \item{age}{Participant's age (years)}
#'   \item{educ}{Participant's years of schooling (years)}
#'   \item{black}{Whether the participant was black (dummy)}
#'   \item{hispan}{Whether the participant was hispanic (dummy)}
#'   \item{married}{Whether the participant was married (dummy)}
#'   \item{nodegree}{Whether the participant has no high school degree (dummy)}
#'   \item{re74, re75, re78}{Participant's income in 1974, 1975, and 1978 (dollars)}
#' }
#'
#' @examples
#'
#' # Download the data and save it as a data frame:
#' PackageDataAsset <- GetDataAsset()
#'
#' @source LaLonde, R. J. (1986). Evaluating the econometric evaluations of training programs with experimental data. The American Economic Review, 604-620.
#'
#' @export
#'
#' @md

GetDataAsset <- function() {
  # adapt URL to allow for direct download
  url_dr <- "https://www.dropbox.com/s/5mzc60tbh09ew49/lalonde%20nsw.csv.zip?dl=0"
  url_dr <- gsub(url_dr, pattern = "www.dropbox.com", replacement = "dl.dropboxusercontent.com")

  # create temporary file (for .zip) and folder (for unzipped contents)
  temp_file_zipped <- tempfile("zipped", fileext = ".zip")
  temp_folder_unzipped <- tempfile("unzipped")

  # download file and unzip
  download.file(url = url_dr, destfile = temp_file_zipped)
  unzip(temp_file_zipped, junkpaths = T, exdir = temp_folder_unzipped)

  # read .csv data
  out_df <- read.csv(
    file = list.files(temp_folder_unzipped, pattern = ".csv", full.names = T),
    row.names = 1
  )

  # remove temp file and folder
  file.remove(temp_file_zipped)
  unlink(temp_folder_unzipped)

  return(out_df)
}
