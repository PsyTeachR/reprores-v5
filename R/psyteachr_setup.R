# psyTeachR styles and functions
# do not edit!!!!!

if (requireNamespace("glossary", quietly = TRUE)) {
  suppressPackageStartupMessages({
    library(glossary)
  })
  
  glossary_path("psyteachr")
  glossary_popup("hover")
}

## set global theme options for figures
if (requireNamespace("ggplot2", quietly = TRUE)) {
  ggplot2::theme_set(ggplot2::theme_bw())
}


## palette with psyTeachR logo colour
psyteachr_colours <- function(vals = 1:6) {
  ptrc <- c(
    "pink" = "#983E82",
    "orange" = "#E2A458",
    "yellow" = "#F5DC70",
    "green" = "#59935B",
    "blue" = "#467AAC",
    "purple" = "#61589C"
  )
  
  unname(ptrc[vals])
}
psyteachr_colors <- psyteachr_colours



# inline code highlighting and styles

hl <- function(code) {
  txt <- rlang::enexpr(code) %>% rlang::as_label()

  downlit::highlight(txt, classes = downlit::classes_pandoc()) %>%
    gsub("a href", "a target='_blank' href", .) %>%
    paste0("<code>", . , "</code>")
}

path <- function(txt) {
  sprintf("<code class='path'>%s</code>", txt)
}

pkg <- function(txt, url = NULL) {
  if (is.null(url)) {
    sprintf("<code class='package'>%s</code>", txt)
  } else {
    sprintf("<code class='package'><a href='%s' target='_blank'>%s</a></code>", url, txt)
  }
}
