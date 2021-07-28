#' Create a radminkit body
#'
#' @param ... Elements to put in the body of the dashboard
#'
#'
#' @importFrom shiny tags
#' @export
#'
radminkitBody <- function(...) {

	tags$main(
		class = "content",
		tags$div(
			class = "container-fluid p-0",
			...
		)
	)
}
