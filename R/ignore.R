#' Add files to `.Rbuildignore`
#'
#' `.Rbuildignore` has a regular expression on each line, but it's
#' usually easier to work with specific file names. By default,
#' `use_build_ignore` will (crudely) turn a filename into a regular
#' expression that will only match that path. Repeated entries will be
#' silently removed.
#'
#' `use_build_ignore` is designed to ignore *individual* files. If you
#' want to ignore *all* files with a given extension, consider providing
#' an "as-is" regular expression, using `escape = FALSE`; see examples.
#'
#' @param files Character vector of path names.
#' @param escape If `TRUE`, the default, will escape `.` to
#'   `\\.` and surround with `^` and `$`.
#' @export
#' @examples
#' \dontrun{
#' # ignore all Excel files
#' use_build_ignore("[.]xlsx$", escape = FALSE)
#' }
use_build_ignore <- function(files, escape = TRUE) {
  if (escape) {
    files <- escape_path(files)
  }

  write_union(proj_path(".Rbuildignore"), files)
}

escape_path <- function(x) {
  x <- gsub("\\.", "\\\\.", x)
  x <- gsub("/$", "", x)
  paste0("^", x, "$")
}
