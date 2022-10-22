
options(future.rng.onMisuse = "ignore")
library(furrr)
plan(multisession)

arrow_r_home <- fs::path_abs("../arrow/r")

# Note: RcisTarget is bioconductor

# Query reverse depencencies ----------

rev_imports <- c("CDMConnector", "ClickHouseHTTP", "dataversionr", "diffdfs",
                 "disk.frame", "gbifdb", "MolgenisArmadillo", "parqr",
                 "receptiviti", "sfarrow", "starvz", "strand", "tradestatistics"
)

rev_suggests <- c("analogsea", "arkdb", "duckdb", "mrgsim.parallel", "nflreadr",
                  "noctua", "opencpu", "pins", "plumber", "pointblank", "RAthena",
                  "raveio", "rio", "sparklyr", "targets")

rev_deps <- sort(c(rev_imports, rev_suggests))

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

# install dependencies to a dedicated library
deps_ref <- deps$ref

# Rmpi not available on MacOS
if (Sys.info()["sysname"] == "Darwin") {
  deps_ref <- setdiff(deps_ref, "Rmpi")
}

pak::pkg_install(deps_ref, upgrade = TRUE)

# Install CRAN arrow
pak::pkg_install("arrow")

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

# Install local arrow
pak::pkg_install(paste0("local::", arrow_r_home))

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

saveRDS(rev_deps, "rev_deps.rds")
saveRDS(results, "results_with_cran.rds")
saveRDS(results2, "results_with_local.rds")
