#' Create a radminkit page
#'
#' @param header A header created with \code{\link{radminkitHeader}}
#' @param sidebar A sidebar created with \code{\link{radminkitSidebar}}
#' @param title Page title. This is the name that will appear in the browser tab
#' @param loader Loading indicator on top of page
#'
#'
#' @export
#'
radminkitPage <- function(header, sidebar, body = NULL, title = NULL, loader = TRUE) {

  # tagAssert(header, type = "header", class = "navbar main-header navbar-expand-lg navbar-light")
  # tagAssert(sidebar, type = "nav", class = "main-sidebar")

  loaderHtml <-
    div(
      class = "loader-bg",
      div(
        class = "loader-track",
        div(class = "loader-fill")
      )
    )


  # tags$html(
  head(
    title(title),
    meta(charset = "utf-8"),
    meta(
      name = "viewport",
      content = "width=device-width, initial-scale=1, shrink-to-fit=no"
    ),
    meta(`http-equiv` = "X-UA-Compatible", content = "IE=edge")
  )

  addDeps(
    body(
      if (loader) loaderHtml,
      sidebar # ,
      # header#,
      # body
      # HTML('<script async src="js/script.js"></script>')
    )
  )
  # )
}
