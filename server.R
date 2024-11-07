# file containing the backend for the app
# Define the Server (Backend)
# Load needed libraries
library("bslib")
library("shiny")
library("ggplot2")
library("stringr")

source(file = "app_functions.R")

server <- function(input, output) {
  # Handles the creation of a random DNA sequence
  output$dna <- renderText({
    gene_dna(length = input$n_bases, base_probs = c(input$prob_A, input$prob_T, input$prob_C, input$prob_G))
  })
  # Handles the DNA-->RNA transcription
  output$rna_output <- renderText({
    transcribe_dna(dna = input$DNA_sequence)
  })
  # Handles the RNA-->protein translation
  output$protein <- renderText({
    translate_rna(rna = input$RNA_sequence)
  })
  # Handles the creation of the frequency plot
  output$frequency_plot <- renderPlot({
    frequency_data <- base_freqs(input$sequence_for_frequency_analysis)
    ggplot(frequency_data, aes(x = dna_vec, y = Freq, fill = dna_vec)) +
      geom_bar(stat = "identity") +
      labs(x = "Base", y = "Frequency", title = "Frequency of DNA bases") +
      scale_fill_manual(values = c("A" = "#1F78B4",   # Muted blue
                                   "T" = "#33A02C",   # Muted green
                                   "C" = "#E31A1C",   # Muted red
                                   "G" = "#FF7F00",
                                   "U" = "#6A3D9A")) +
      theme(legend.position = "none")
  })
}