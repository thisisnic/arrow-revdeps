
options(future.rng.onMisuse = "ignore")
library(furrr)
plan(multisession)

rev_deps <- readRDS("rev_deps.rds")

# Install local arrow
pak::pkg_install(Sys.getenv("ARROW_R_REVDEP_NEW_REF", "ARROW_R_REVDEP_NEW_REF_NOT_SET"))
stopifnot(packageVersion("arrow") == Sys.getenv("ARROW_R_REVDEP_VERSION_NEW", "NOT_SET"))

unlink("check_with_local", recursive = TRUE)
dir.create("check_with_local")

# Run the checks again
results2 <- future_map(rev_deps, ~{
  pkg <- file.path("rev_deps", .x)
  try(
    rcmdcheck::rcmdcheck(
      pkg,
      check_dir = file.path(getwd(), "check_with_local", .x),
      quiet = TRUE
    )
  )
}, .progress = TRUE)

failed2 <- vapply(results2, inherits, logical(1), "try-error")
if (any(failed2)) {
  message(glue::glue("{sum(failed2)} packages failed to check:"))
  message(
    paste0(
      glue::glue(
        "- rcmdcheck::rcmdcheck(\"rev_deps/{rev_deps[failed2]}\")",
      ),
      collapse = "\n"
    )
  )
}

saveRDS(results2, "results_with_local.rds")
