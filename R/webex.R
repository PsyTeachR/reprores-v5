suppressPackageStartupMessages({
  library(webexercises)
})

# hide <- function (button_text = "Solution") {
#   paste0("\n::: {.callout-note .webex-solution collapse='true'}\n## ", 
#            button_text, "\n\n")
# }
# 
# unhide <- function () {
#   "\n:::\n\n"
# }
# 
# knitr::knit_hooks$set(webex.hide = function(before, options, envir) {
#   if (before) {
#     if (is.character(options$webex.hide)) {
#       hide(options$webex.hide)
#     } else {
#       hide()
#     }
#   } else {
#     unhide()
#   }
# })
