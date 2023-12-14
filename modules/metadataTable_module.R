# This is a metadata table module for samples in the experiment

metadataTableUI <- function(id, label = "Input text: ") {
  ns <- NS(id)
  tagList(
    textOutput(ns("result"))
  )
}

metadataTableServer <- function(id, prefix = "Test:") {
  moduleServer(
    id,
    function(input, output, session) {
      output$result <- renderPrint({
        paste0(prefix, "Metadata Table goes here.")
      })
    }
  )
}
