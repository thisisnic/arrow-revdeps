
testthat::local_reproducible_output()
library(tidyverse)
library(rcmdcheck)

rev_deps <- readRDS("rev_deps.rds")
results_with_cran <- readRDS("results_with_cran.rds")
results_with_local <- readRDS("results_with_local.rds")

check_df <- function(lst, label) {
  has_error <- map_lgl(lst, inherits, "try-error")
  lst[has_error] <- list(NULL)

  tibble(
    label = label,
    pkg = rev_deps,
    notes = map(lst, "notes"),
    warnings = map(lst, "warnings"),
    errors = map(lst, "errors")
  )
}

df_with_cran <- check_df(results_with_cran, "CRAN")
df_with_local <- check_df(results_with_local, "local")

has_difference <- logical(length(rev_deps))
for (i in seq_along(has_difference)) {
  has_difference[i] <- !identical(df_with_cran[i, -1], df_with_local[i, -1])
}

cat("# Changes\n\n")

for (i in which(has_difference)) {
  cat(glue::glue("## {rev_deps[i]}"))
  cat("\n\n### With CRAN arrow\n\n```\n")

  print(results_with_cran[[i]])

  cat("\n```\n\n### With local arrow\n\n```\n")

  print(results_with_local[[i]])

  cat("\n\n```\n\n")
}

cat("# Check Summary\n\n")

cat("## CRAN\n\n")

print(df_with_cran, n = Inf)

cat("## Local\n\n")

print(df_with_local, n = Inf)

cat("# All notes and errors")

df_with_stuff <- df_with_local |>
  mutate(
    i = seq_len(n()),
    n_notes = map_int(notes, length),
    n_warnings = map_int(warnings, length),
    n_errors = map_int(errors, length)
  ) |>
  filter(n_notes > 0 | n_warnings > 0 | n_errors > 0) |>
  arrange(desc(n_errors), desc(n_warnings), desc(n_notes))


for (i in df_with_stuff$i) {
  cat(glue::glue("## {rev_deps[i]}\n\n```\n\n"))
  print(results_with_cran[[i]])
  cat("\n\n```\n\n")
}
