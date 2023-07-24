
# clean up previous run
unlink(c("check_with_cran", "check_with_local", "rev_deps"), recursive = TRUE)
unlink(c("results_with_cran.rds", "results_with_local.rds", "rev_deps.rds"))

# Set old + new version strings used for asserting versions
# reference is used for pak::pkg_install() to install the new version
# (can be local::path/to/arrow/r or pre-packaged tarball)

version_old <- "12.0.1.1"
version_new <- "13.0.0"
Sys.setenv("ARROW_R_REVDEP_VERSION_OLD" = version_old)
Sys.setenv("ARROW_R_REVDEP_VERSION_NEW" = version_new)
Sys.setenv("ARROW_R_REVDEP_NEW_REF" = "local::/Users/dewey/Desktop/rscratch/arrow/r")

callr::rscript("01-deps.R", fail_on_status = TRUE)
callr::rscript("02-check-cran.R", fail_on_status = TRUE)
callr::rscript("03-check-local.R", fail_on_status = TRUE)

out_summary_file <- glue::glue("summary-{version_old}-{version_new}.md")
callr::rscript("04-compare.R", stdout = out_summary_file, show = FALSE)
