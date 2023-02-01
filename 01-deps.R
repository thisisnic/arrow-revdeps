options(future.rng.onMisuse = "ignore")
library(furrr)
plan(multisession)

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

# pak doesn't quite get the dependencies right and R CMD check is by default
# picky about having all Suggested/Enhances dependencies available.
pkgs_deps <- pkgs[
  pkgs[, "Package"] %in% rev_deps,
  c("Package", "Depends", "Imports", "LinkingTo", "Suggests", "Enhances")
]

pkgs_deps <- gsub("\\(.*?\\)", "", as.character(pkgs_deps)) |>
  strsplit("\\s*,\\s*") |>
  unlist() |>
  trimws() |>
  unique() |>
  # Built-in packages aren't in available.packages()
  setdiff(c("R", "stats", "tools", "utils", "methods", "datasets", "grDevices", "parallel")) |>
  sort()

# Rmpi not available on MacOS
if (Sys.info()["sysname"] == "Darwin") {
  pkgs_deps <- setdiff(pkgs_deps, "Rmpi")
}

unavailable_packages <- setdiff(pkgs_deps, pkgs[, "Package"])
if (length(unavailable_packages) > 0) {
  message(glue::glue("{length(unavailable_packages)} dependency package not installable via pak::pkg_install():"))
  for (pkg in unavailable_packages) {
    message(glue::glue("- {pkg}"))
  }

  message("You may need to install via GitHub")
}

pkgs_deps <- setdiff(pkgs_deps, unavailable_packages)

# CRAN will use the latest versions, so we need to here too
pak::pkg_install(pkgs_deps, upgrade = TRUE)

# Install the local versions of the checked-out sources. This is useful
# for ensuring that all our dependencies are actually going to build.
rev_deps_pak <- paste0("local::rev_deps/", rev_deps)
pak::pkg_install(rev_deps_pak, upgrade = TRUE)
