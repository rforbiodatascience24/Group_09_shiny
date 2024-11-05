# file containing the definition of the user interface
# Define the User Interface (Frontend)
ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #F0F0F0; padding: 15px;"
    )),
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("This app allows to create a random DNA sequence of the desired length. The probabilities of each base to be included can also be manually set.")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Generator"),
      sliderInput(inputId = "n_bases",
                  label = "Number of bases:",
                  min = 1,
                  max = 60,
                  value = 30,
                  width = "100%"),
      # space of the probabilities input
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput(inputId = "prob_A",
                     label = "Probability of A",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_T",
                     label = "Probability of T",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_C",
                     label = "Probability of C",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_G",
                     label = "Probability of G",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1)),
      # space of the generator output
      helpText("Generated DNA Sequence:"),
      verbatimTextOutput(outputId = "dna")
    ),
  ),
  # RNA polymerase card
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual RNA polymerase"),
      textInput(inputId = "DNA_sequence",
                label = "DNA sequence to be transcribed:",
                placeholder = "Insert the DNA sequence"),
      # space of the transcribed RNA sequence
      helpText("Generated RNA Sequence:"),
      verbatimTextOutput(outputId = "rna_output")
    ),
  ),
  # Virtual Ribosome
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual ribosome"),
      textInput(inputId = "RNA_sequence",
                label = "RNA sequence to be translated:",
                placeholder = "Insert the RNA sequence"),
      # space of the transcribed RNA sequence
      helpText("Generated protein:"),
      verbatimTextOutput(outputId = "protein"),
    ),
  ),
  # Base-frequency space
  layout_columns(
    col_widths = 12,
    card(
      card_header("Base-frequency plot"),
      textInput(inputId = "sequence_for_frequency_analysis",
                label = "Sequence to be analysed:",
                placeholder = "Insert the DNA/RNA sequence"),
      plotOutput(outputId = "frequency_plot")
    ),
  ),
)