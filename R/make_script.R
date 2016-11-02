#' Create script for git filter-branch
#' 
#' @param issue_data data frame with columns  mapping Trac tickets to GitHub issues, see Details
#' @param outfile output file name
#' @param fun function performing actual rewriting
#' @param script_template path to script template
#' @param ... other arguments passed to \code{\link{whisker_render}}
#' 
#' @details
#' This function uses \pkg{whisker} templating mechanism to generate a script
#' file that can be used with \code{git filter-branch} to rewrite commit
#' messages based on Trac ticket to GitHub issues mapping.
#' 
#' @return
#' Nothing
#' 
#' @seealso
#' \code{\link{link_issue}}
#' 
#' @export
make_script <- function(issue_data, outfile="", fun=link_issue, 
                        script_template=NULL, ...) {
  # Get template
  if(is.null(script_template)) {
    l <- readLines( system.file("templates/default.R", package="trac2gh") )
  } else
    l <- readLines(script_template)
  tmp <- paste(l, collapse="\n")
  r <- whisker::whisker.render(
    tmp, 
    data=list(
      issue_data = deparse(issue_data),
      link_issue_function = deparse(fun)
    ),
    ...
  )
  # Output
  cat(r, file=outfile)
}