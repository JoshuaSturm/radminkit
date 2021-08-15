#' Create a radminkit header
#'
#' @param disable Disable the header
#' @param title Dashboard title
#' @param logo (Optional) Logo to display before title. Can be an icon or a link to an image.
# #' @param titleWidth (optional) Width of the header title
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
    nav(
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
