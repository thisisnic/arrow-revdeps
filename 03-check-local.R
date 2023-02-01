
options(future.rng.onMisuse = "ignore")
library(furrr)
plan(multisession)

arrow_r_home <- fs::path_abs("../arrow/r")
rev_deps <- readRDS("rev_deps.rds")

# Install local arrow
# withr::with_dir(arrow_r_home, usethis::pr_fetch(14772))
# ...rebuild libarrow. For me I have a script called "../arrow-build.sh"
# that does this locally and much faster than a source install.
# Alternatively, you could do make sync-cpp and R CMD INSTALL .
# from the R directory
pak::pkg_install(paste0("local::", arrow_r_home))
stopifnot(packageVersion("arrow") == "11.0.0")

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
