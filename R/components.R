#' Create a Bootstrap 5 card
#'
#' @param ... Additional card parameters
#' @param title Title of the card.
#' @param subtitle (Optional) Card subtitle.
#' @param header (Optional) Card header.
#' @param footer (Optional) Card Footer
#' @param text Main body of the card.
#'
#' @seealso https://getbootstrap.com/docs/5.0/components/card/
#'
#' @importFrom shiny tags
#' @export
#'
radminkitCard <- function(..., title = NULL, subtitle = NULL, header = NULL, footer = NULL, text) {

  headerHtml <-
    tags$div(
      class = "card-header",
      header
    )

  titleHtml <-
    h5(
      class = "card-title",
      title
    )

  subtitleHtml <-
    h6(
      class = "card-subtitle mb-2 text-muted",
      subtitle
    )

  tags$div(
    class = "card",
    if (!is.null(header)) headerHtml,
    tags$div(
      class = "card-body",
      if (!is.null(title)) titleHtml,
      if (!is.null(subtitle)) subtitleHtml,
      text
    ),
    ...
  )

}
