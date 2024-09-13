# book-specific code to include on every page

embed_youtube <- function(url, width = 560, height = 315, border = 0) {
  sprintf("<iframe width=\"%s\" height=\"%s\" src=\"https://www.youtube.com/embed/%s\" frameborder=\"%s\" allowfullscreen></iframe>",
          width, height, url, border)
}

showtbl <- function(data, n = 6) {
  nm <- utils::capture.output(match.call()$data)
  if (n < nrow(data)) {
    cp <- sprintf("Rows 1-%s from `%s`", n, nm)
  } else {
    n <- nrow(data)
    cp <- sprintf("All rows from `%s`", nm)
  }
  
  data %>%
    ungroup() %>%
    slice(1:n) %>%
    knitr::kable(caption = cp)
}

glossary_table <- function(as_kable = TRUE) {
  glossary <- glossary_options("table")
  if (is.null(glossary))
    glossary <- list()
  term <- names(glossary)
  linked_term <- term
  if (!is.null(glossary_path()) && glossary_path() == "psyteachr") {
    lcterm <- gsub(" ", "-", tolower(term), fixed = TRUE)
    first_letter <- substr(lcterm, 1, 1)
    linked_term <- paste0(" [", lcterm, "](https://psyteachr.github.io/glossary/",
                          first_letter, "#", lcterm, "){target='_blank' class='glossary'} ")
  }
  if (is.null(term)) {
    data.frame()
  } else if (as_kable) {
    the_list <- data.frame(term = linked_term, definition = unlist(glossary))
    knitr::kable(the_list[order(term), ],
          escape = FALSE,
          row.names = FALSE, )
  } else {
    the_list <- data.frame(term = term, definition = unlist(glossary))
    the_list[order(term), ]
  }
}
