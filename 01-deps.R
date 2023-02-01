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
# this also has the effect of making sure all of the reverse dependencies
# we're about to attempt checking will actually install
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
