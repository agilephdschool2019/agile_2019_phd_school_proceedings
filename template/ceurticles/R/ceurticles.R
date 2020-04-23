#' CEUR WS 2-colum with page numbers format.
#'
#' @param ... Additional arguments to \code{rmarkdown::pdf_document()}.
#'
#' @return An R Markdown output format.
#' @details This was adapted from
#' \url{http://ceur-ws.org/Vol-XXX/samplestyles/}.
#'
#' \strong{Important note:} This template is _not_ supported by CEUR-WS.
#'
#' @examples
#' \dontrun{
#' library("rmarkdown")
#' draft("MyArticle.Rmd", template = "twocolpceurws", package = "ceurticles")
#' render("MyArticle/MyArticle.Rmd")
#' }
#' 
#' @importFrom rmarkdown pdf_document
#' 
#' @export
twocolpceurws_article <- function(...) {
  template <- "twocolpceurws_article"
  file <- "template.tex"
  res <- system.file("rmarkdown", "templates", template, "resources", file,
                     package = "ceurticles")
  if (res == "") 
    stop("Couldn't find template file ", template, "/resources/", file, call. = FALSE)
  
  rmarkdown::pdf_document(..., template = res)
}

# quick dev shortcut for Ubuntu: click "Install and restart" then run:
# unlink("MyArticle/", recursive = TRUE); rmarkdown::draft("MyArticle.Rmd", template = "twocolpceurws_article", package = "ceurticles", edit = FALSE); rmarkdown::render("MyArticle/MyArticle.Rmd"); system(paste0("xdg-open ", here::here("MyArticle", "MyArticle.pdf")))
