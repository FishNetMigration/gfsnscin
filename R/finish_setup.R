#' Finish gfsgn project setup
#' @description Several of the analysis procedures rely on custom functions. Rather than a
#' vignette approach, this function copies template analysis scripts that establish a workflow
#' based on the existing package functions. The template files are "auto-magically" created
#' following the project naming procedures and directories.
#' @return NULL
#' @export
#'
#' @examples
#' finish_setup()
finish_setup <- function() {
  has_folders <- all(dir.exists(c("1_Annual_Protocol", "2_Data", "3_Analysis", "4_Reports")))

  if (!has_folders) {
    usethis::ui_oops("The necessary folder structure does not exist.")
  }

  if (has_folders) {
    usethis::use_template(
      template = "hellogfs.R",
      save_as = "3_Analysis/hellogfs.R",
      package = "gfsnscin"
    )
    # other templates as required
    # usethis::use_template(
    #   template = "hellogfs.R",
    #   save_as = "3_Analysis/hellogfs.R",
    #   package = "gfsfcin"
  }

  rmarkdown::render("ReadMe.md")
  usethis::ui_done("ReadMe file rendered to html")
  rstudioapi::documentOpen("ReadMe.md")
  rmarkdown::render("Instructions.md")
  usethis::ui_done("Instructions file rendered to html")
}
