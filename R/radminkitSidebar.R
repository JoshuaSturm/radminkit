#' Create a radminkit sidebar
#'
#' @param title Brand title to use in the sidebar
#' @param width (optional) Width of the sidebar
#' @param ... Optional items to put in the sidebar. See Details sections
#'
#' @details
#' The `title` can be text, an image, or both.
#' To include mutliple objects, e.g. a picture and some text, wrap them in a list.
#'
#'
#' @examples
#' \dontrun{
#' radminkitSidebar(title = list(img("path/to/img", alt = "description of image")))
#' }
#'
#' @export
#'
radminkitSidebar <- function(..., title = NULL, width = NULL, header = NULL) {
  width <- validateCssUnit(width)
  update_width <- NULL

  if (!is.null(width)) {
    update_width <- tags$head(style(HTML(gsub("_WIDTH_", width, fixed = TRUE, "

      @media (max-width: 991.98px) and (min-width: 1px) {
        .sidebar{
          margin-left: -_WIDTH_;
        }
      }

      [data-simplebar] {
        width: _WIDTH_;
      }

      .sidebar.collapsed {
        margin-left: -_WIDTH_
      }

      .sidebar {
        min-width: _WIDTH_;
        max-width: _WIDTH_;
      }
    "))))
  }

  div(
    class = "wrapper",
    nav(
      class = "sidebar js-sidebar",
      id = "sidebar",
      update_width,
      div(
        class = "sidebar-content js-simplebar",
        a(
          class = "sidebar-brand",
          href = "#",
          span(
            class = "align-middle",
            title
          )
        ),
        # All sidebar items
        list(...)
      )
    ),
    header
  )
}

#' Create a sidebar tab menu
#'
#' Can add a section, menu, and submenu.
#'
#' @param ... Items to add to the tablist
#'
#' @export
#'
sidebarTabs <- function(...) {
  do.call(ul, c(class = "list-group", id = "menuTabs", role = "tablist", list(...)))
}

#' Create a sidebar section to split tabs by category.
#'
#' @param label Section name
#'
#' @export
#'
sidebarSection <- function(label = "Section Label") {
  li(
    class = "sidebar-header",
    label
  )
}

#' Create a section entry
#'
#' @param tabName Name of the tab
#' @param subitems Item(s) to add to the sidebar
#' @param icon (Optional) icon to display next to the tab name
#' @param href Link to tab
#' @param itemTags (Optional) tags for the tab
#'
#' @details
#' Radminkit uses \href{https://feathericons.com/}{Feather icons}; refer to their site for the full catalogue of options.
#'
#' @export
#'
sidebarItem <- function(..., label = NULL, tabName = NULL, icon = NULL, itemTags = NULL, href = NULL, newTab = TRUE) {
  subItems <- list(...)

  if (!is.null(href) + !is.null(tabName) + (length(subItems) > 0) != 1) {
    stop("Must have either href, tabName, or sub-items (contained in ...).")
  }

  # If tags is a character vector, combine into a single string
  if (is.vector(itemTags) & length(itemTags) > 1L) {
    paste(itemTags, collapse = " ")
  }

  # If there's a tabName, set up the correct href and <a> target
  isTabItem <- FALSE
  target <- NULL
  if (!is.null(tabName)) {
    validateTabName(tabName)
    isTabItem <- TRUE
    href <- paste0("#shiny-tab-", tabName)
  } else if (is.null(href)) {
    href <- "#"
  } else {
    # If supplied href, set up <a> tag's target
    if (newTab) {
      target <- "_blank"
    }
  }

  # When there are no submenu items
  if (length(subItems) == 0L) {
    return(
      li(
        class = "sidebar-item",
        # role = "presentation",
        a(
          class = "sidebar-link",
          id = paste0(tabName, "-tab"),
          `data-bs-toggle` = if (isTabItem) "tab",
          `data-bs-target` = paste0("#", tabName),
          href = paste0("#", tabName),
          `role` = if (isTabItem) "tab",
          `aria-controls` = tabName,
          i(
            class = "align-middle",
            `data-feather` = icon
          ),
          span(
            class = "align-middle",
            label
          )
        )
      )
    )
  }

  # Where there are submenu items
  li(
    class = "sidebar-item",
    a(
      class = "sidebar-link",
      `data-bs-target` = paste0("#", tabName),
      `data-bs-toggle` = "collapse",
      href = paste0("#", tabName),
      i(
        class = "align-middle",
        `data-feather` = icon
      ),
      span(
        class = "align-middle",
        label
      )
    ),
    do.call(ul, c(class = "sidebar-dropdown list-group collapse", id = tabName, `data-bs-parent` = "#sidebar", subItems))
  )
}

#' @export
sidebarSubitem <- function(tabName = NULL, href = NULL, icon = NULL) {
  if (!is.null(href) && !is.null(tabName)) {
    stop("Can't specify both href and tabName")
  }

  # If there's a tabName, set up the correct href
  isTabItem <- FALSE
  target <- NULL
  if (!is.null(tabName)) {
    validateTabName(tabName)
    isTabItem <- TRUE
    href <- paste0("#shiny-tab-", tabName)
  } else if (is.null(href)) {
    href <- "#"
  } else {
    # If supplied href, set up <a> tag's target
    if (newTab) {
      target <- "_blank"
    }
  }

  li(
    class = "sidebar-item",
    role = "presentation",
    a(
      class = "sidebar-link",
      id = if (isTabItem) paste0(tabName, "-tab"),
      href = paste0("#", tabName),
      `data-bs-toggle` = if (isTabItem) "tab",
      `data-bs-target` = paste0("#", tabName),
      `aria-controls` = tabName,
      `role` = if (isTabItem) "tab",
      tabName
    )
  )
}
