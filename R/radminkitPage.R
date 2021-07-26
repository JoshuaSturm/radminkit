#' Create a radminkit page
#'
#' @param header A header created with \code{\link{radminkitHeader}}
#' @param sidebar A sidebar created with \code{\link{radminkitSidebar}}
#' @param title Page title. This is the name that will appear in the browser tab
#' @param loader Loading indicator on top of page
#'
#'
#' @importFrom shiny tags
#' @export
#'
radminkitPage <- function(header, sidebar, body = NULL, title = NULL, loader = TRUE) {

  # tagAssert(header, type = "header", class = "navbar main-header navbar-expand-lg navbar-light")
  # tagAssert(sidebar, type = "nav", class = "main-sidebar")

  loaderHtml <-
    tags$div(
      class = "loader-bg",
      tags$div(
        class="loader-track",
        tags$div(class="loader-fill")
      )
    )


  # tags$html(
    tags$head(
      tags$title(title),
      tags$meta(charset="utf-8"),
      tags$meta(
        name="viewport",
        content = "width=device-width, initial-scale=1, shrink-to-fit=no"
      ),
      tags$meta(`http-equiv` = "X-UA-Compatible", content = "IE=edge")
    )

    addDeps(
      tags$body(
        if (loader) loaderHtml,
        sidebar#,
        # header#,
        # body
        # HTML('<script async src="js/script.js"></script>')
      )
    )
  # )
}
