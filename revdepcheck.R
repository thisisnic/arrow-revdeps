
options(future.rng.onMisuse = "ignore")
library(furrr)
plan(multisession)

arrow_r_home <- fs::path_abs("../arrow/r")

# Note: RcisTarget is bioconductor

# Query reverse depencencies ----------

pkgs <- available.packages()
rev_imports <- unname(pkgs[grepl("\\barrow\\b", pkgs[, "Imports"]) , "Package"])
rev_suggests <- unname(pkgs[grepl("\\barrow\\b", pkgs[, "Suggests"]) , "Package"])
rev_deps <- sort(c(rev_imports, rev_suggests))
saveRDS(rev_deps, "rev_deps.rds")

unlink("rev_deps", recursive = TRUE)
dir.create("rev_deps")

# Fetch reverse dependency sources ----------

# Fetch dependency sources from cran/XXX
future_walk(
  rev_deps,
  ~system(glue::glue("git clone https://github.com/cran/{.x} rev_deps/{.x}")),
  .progress = TRUE
)

# Install dependencies needed for checking ----------

# collect dependencies and install them
rev_deps_pak <- paste0("local::rev_deps/", rev_deps)
deps <- pak::pkg_deps(rev_deps_pak, upgrade = TRUE, dependencies = TRUE)

# Note: installing dependencies to a dedicated library doesn't quite work
# everywhere, so this will install everything to your local R install.
# If you don't want that, you currently have to use a docker image.
deps_ref <- deps$ref

# Rmpi not available on MacOS
if (Sys.info()["sysname"] == "Darwin") {
  deps_ref <- setdiff(deps_ref, "Rmpi")
}

# CRAN will use the latest versions, so we need to here too
pak::pkg_install(deps_ref, upgrade = TRUE)

# Install CRAN arrow and make sure we're using *CRAN* arrow
pak::pkg_install("arrow")
stopifnot(packageVersion("arrow") == "10.0.0")

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

# Install local arrow
# withr::with_dir(arrow_r_home, usethis::pr_fetch(14772))
# ...rebuild libarrow. For me I have a script called "../arrow-build.sh"
# that does this locally and much faster than a source install.
# Alternatively, you could do make sync-cpp and R CMD INSTALL .
# from the R directory
pak::pkg_install(paste0("local::", arrow_r_home))
stopifnot(packageVersion("arrow") == "10.0.1")

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
