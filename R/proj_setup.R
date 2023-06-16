proj_setup <- function(path, ...) {

  # Create directories
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  dir.create(paste0(path, "/1_Annual_Protocol"), recursive = TRUE, showWarnings = FALSE)
  dir.create(paste0(path, "/2_Data"), recursive = TRUE, showWarnings = FALSE)
  dir.create(paste0(path, "/3_Analysis"), recursive = TRUE, showWarnings = FALSE)
  dir.create(paste0(path, "/4_Reports"), recursive = TRUE, showWarnings = FALSE)

  # create some header text
  header <- c(
    "# GFS NSCIN Project",
  )

  filetable <- c(
    "## Folder Description and Contents",
    "File | Data processing notes",
    "---------- | --------------------------------------------------",
    "**1_Annual_Protocol** | Annual protocol files",
    "**2_Data** | Raw and processed data",
    "**3_Analysis** | Analysis scripts and functions",
    "**4_Reports** | Reports and figures"
  )

  instructions <- c(
    "# GFS FCIN Project Template Intructions  ",
    "This file is best viewed by using the *Preview* feature in RStudio.  ",
    " ",
    "## What's included  ",
    "1. ReadMe.md template  ",
    "2. Instructions.md template  ",
    "3. A gitignore file. If you have git installed you will still need to run `git init` to initialize the repo.  ",
    "4. Template folder directory - directory structure is required for package functions to run as intended.  ",
    "5. Example analysis scripts to aid function use and data processing.  ",
    "  ",
    "## Instructions  ",
    "1. Run `gfsnscin::finish_setup()` to complete the project set up.  ",
    "2. In folder **1_Annual_Protocol**",
    "Reveiw and update the `ReadMe.md` file as needed. View: [ReadMe](ReadMe.html).  ",
    " ",
    "## Data Processing Steps  "

  )


  writeLines(c(instructions, " ", filetable), con = file.path(path, "Instructions.md"))

  # collect inputs and paste together as 'Parameter: Value'
  dots <- list(...)
  text <- lapply(seq_along(dots), function(i) {
    key <- names(dots)[[i]]
    val <- dots[[i]]
    paste0(key, ": ", val, "<br />")
  })

  # Save input parameter for downstream use
  metadata <- lapply(seq_along(dots), function(i) {
    key <- names(dots)[[i]]
    val <- dots[[i]]
    val
  })

  names(metadata) <- c("Lead", "AREA", "PRJCD", "Year")
  save(metadata, file = file.path(path, "metadata.RData"))

  # collect into single text string
  contents <- paste(
    paste(header, collapse = "\n"),
    paste(text, collapse = "\n"),
    sep = "  \n"
  )

  abstract <-  c(
    "# Post Survey Notes",
    " ",
    "Record progress and describe notable deviations from *2_Annual_Survey_Protocol.html*"
  )

  filetable2 <- c(
    "## Folder Description and Contents",
    "File | Data processing notes",
    "---------- | --------------------------------------------------",
    "**1_Annual_Protocol** | Annual protocol files",
    "**2_Data** | Raw and processed data",
    "**3_Analysis** | Analysis scripts and functions",
    "**4_Reports** | Reports and figures"
  )
  # write to index file
  readme <- c(contents, " ", abstract, " ", filetable2)
  writeLines(readme, con = file.path(path, "ReadMe.md"))

 }
