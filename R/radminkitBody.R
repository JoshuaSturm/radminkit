#' Create a radminkit body
#'
#' @param ... Elements to put in the body of the dashboard
#'
#' @export
#'
radminkitBody <- function(...) {
  tags$main(
    class = "content",
    div(
      class = "container-fluid p-0",
      ...
    )
  )
}
