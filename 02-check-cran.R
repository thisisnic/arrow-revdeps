
options(future.rng.onMisuse = "ignore")
library(furrr)
plan(multisession)

rev_deps <- readRDS("rev_deps.rds")

# Install CRAN arrow and make sure we're using *CRAN* arrow
pak::pkg_install("arrow")
stopifnot(packageVersion("arrow") == Sys.getenv("ARROW_R_REVDEP_VERSION_OLD", "NOT_SET"))

# Run rcmdcheck
unlink("check_with_cran", recursive = TRUE)
dir.create("check_with_cran")

results <- future_map(rev_deps, ~{
  pkg <- file.path("rev_deps", .x)
  try(
    rcmdcheck::rcmdcheck(
      pkg,
      check_dir = file.path(getwd(), "check_with_cran", .x),
      quiet = TRUE
    )
  )
}, .progress = TRUE)

failed <- vapply(results, inherits, logical(1), "try-error")
if (any(failed)) {
  message(glue::glue("{sum(failed)} packages failed to check:"))
  message(
    paste0(
      glue::glue(
        "- rcmdcheck::rcmdcheck(\"rev_deps/{rev_deps[failed]}\")",
      ),
      collapse = "\n"
    )
  )
}

# Save the results!
saveRDS(results, "results_with_cran.rds")
