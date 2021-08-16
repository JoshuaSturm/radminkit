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
radminkitPage <- function(header, sidebar, title = NULL, loader = TRUE) {
  loaderHtml <-
    div(
      class = "loader-bg",
      div(
        class = "loader-track",
        div(class = "loader-fill")
      )
    )

  tags$head(
    tags$title(title),
    tags$meta(charset = "utf-8"),
    tags$meta(
      name = "viewport",
      content = "width=device-width, initial-scale=1, shrink-to-fit=no"
    ),
    tags$meta(`http-equiv` = "X-UA-Compatible", content = "IE=edge")
  )

  add_deps(
    tags$body(
      if (loader) loaderHtml,
      sidebar # ,
      # header#,
      # body
    )
  )
}
