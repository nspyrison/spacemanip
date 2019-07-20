#' Runs a shiny app demonstrating manual tours
#' 
#' Runs a local shiny app that demonstrates manual tour and comparable 
#' traditional techniques for static projections of multivariate data sets.
#' 
#' @return opens a local shiny app
#' 
#' @examples 
#' \dontrun{
#' run_app(example = "intro")
#' run_app(example = "comparison")
#' }
#' @export

# For adjusting or adding more apps it may be useful to read: 
# https://deanattali.com/2015/04/21/r-package-shiny-app/
run_app <- function(example) {
  # locate all the shiny app examples that exist
  validExamples <- list.files(system.file("shiny-examples", package = "spinifex"))
  
  validExamplesMsg <-
    paste0(
      "Valid examples are: '",
      paste(validExamples, collapse = "', '"),
      "'")
  
  # if an invalid example is given, throw an error
  if (missing(example) || !nzchar(example) ||
      !example %in% validExamples) {
    stop(
      'Please run `runExample()` with a valid example app as an argument.\n',
      validExamplesMsg,
      call. = FALSE)
  }
  
  # find and launch the app
  appDir <- system.file("shiny-examples", example, package = "mypackage")
  shiny::runApp(appDir, display.mode = "normal")
}