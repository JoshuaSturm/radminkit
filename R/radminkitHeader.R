#' Create a radminkit header
#'
#' @param disable Disable the header
#' @param body A \code{\link{radminkitBody}} item
#' @param ... Additional components to insert in the header. See details section
#'
#' @details
#' Possibilities include:
#'    A dropdownmenu
#'
#' @export
#'
radminkitHeader <- function(disable = FALSE, body = NULL, ...) {
  items <- list(...)

  div(
    class = "main",
    style = if (disable) "display: none;",
    tags$nav(
      class = "navbar navbar-expand navbar-light navbar-bg",
      a(
        class = "sidebar-toggle js-sidebar-toggle",
        tags$i(class = "hamburger align-self-center")
      ),
      div(
        class = "navbar-collapse collapse",
        items
      )
    ),
    body
  )
}
