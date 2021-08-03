#' Create a badge
#'
#' @param type Type of badge. For included Bootstrap options, see details
#' @param intent (boolean) Is the badge intended to signal a message to the user?
#' @param pill (boolean) Should the badge have a rounded pill shape?
#' @param darktext (boolean) Should the badge use dark text? This is often
#'                 useful for brightly coloured badges.
#' @param text Text to display in the badge
#'
#' @details
#' ## Type
#'
#' Valid options for type include:
#'  - primary
#'  - secondary
#'  - success
#'  - danger
#'  - warning
#'  - info
#'  - light
#'  - dark
#'
#' ## Intent
#' This flag is to indicate whether your badge is meant to alert the user.
#' For example, did you choose the danger badge for the colour scheme, or to
#' warn the user of something. If it is the latter, this flag will add an
#' accessibility class (`.visually-hidden`) to the badge.
#'
#' @seealso https://getbootstrap.com/docs/5.0/badge/
#'
#' @importFrom shiny tags
#' @export
#'
radminkitBadge <- function(type = "secondary", intent = FALSE, pill = FALSE, darktext = FALSE, text = NULL) {

  type <- tolower(type)

  if (!(type %in% validBadges))
    stop("Invalid badge type. See ?radminkitBadge for details.")

  badgeType <- paste0("badge bg-", type)

  if (pill)
    badgeType <- addClass(badgeType, "rounded-pill")

  if (darktext)
    badgeType <- addClass(badgeType, "text-dark")

  intentHtml <-
    tags$span(
      class = "visually-hidden",
      paste0(tools::toTitleCase(type), ": ")
    )

  tags$span(
    class = badgeType,
    if (intent) intentHtml,
    text
  )

}


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
